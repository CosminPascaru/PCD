#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>

#define PORT 8080
#define BUFFER_SIZE 1024

int is_valid_extension(const char *filename) {
    const char *ext = strrchr(filename, '.');
    if (ext != NULL) {
        if (strcmp(ext, ".c") == 0 || strcmp(ext, ".cpp") == 0 || strcmp(ext, ".py") == 0) {
            return 1;
        }
    }
    return 0;
}

void send_file_to_server(int sock, const char *filename) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("fopen");
        return;
    }

    // Send the filename first
    if (send(sock, filename, 40, 0) < 0) {
        perror("send filename");
        fclose(file);
        return;
    }

    char buffer[BUFFER_SIZE];
    size_t bytes_read;

    while ((bytes_read = fread(buffer, 1, BUFFER_SIZE, file)) > 0) {
        size_t total_sent = 0;
        while (total_sent < bytes_read) {
            ssize_t sent = send(sock, buffer + total_sent, bytes_read - total_sent, 0);
            if (sent < 0) {
                perror("send file");
                fclose(file);
                return;
            }
            total_sent += sent;
        }
    }

    fclose(file);
    shutdown(sock, SHUT_WR);

    FILE *output_file;
    char output_filename[256];
    snprintf(output_filename, sizeof(output_filename), "%s.temp", filename);
    output_file = fopen(output_filename, "wb");
    if (!output_file) {
        perror("fopen output");
        return;
    }

    while ((bytes_read = recv(sock, buffer, BUFFER_SIZE, 0)) > 0) {
        fwrite(buffer, 1, bytes_read, output_file);
    }

    fclose(output_file);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename1> <filename2> ...\n", argv[0]);
        return EXIT_FAILURE;
    }

    for (int i = 1; i < argc; i++) {
        if (is_valid_extension(argv[i])) {
            int sock;
            struct sockaddr_in server_addr;

            sock = socket(AF_INET, SOCK_STREAM, 0);
            if (sock < 0) {
                perror("socket");
                return EXIT_FAILURE;
            }

            server_addr.sin_family = AF_INET;
            server_addr.sin_port = htons(PORT);
            server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");

            if (connect(sock, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
                perror("connect");
                close(sock);
                return EXIT_FAILURE;
            }

            send_file_to_server(sock, argv[i]);
            close(sock);
        } else {
            fprintf(stderr, "Invalid file extension: %s\n", argv[i]);
        }
    }

    return EXIT_SUCCESS;
}
