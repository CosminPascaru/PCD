#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <pthread.h>
#include <sys/socket.h>

#define PORT 8080
#define BUFFER_SIZE 1024

_Atomic int thread_counter = 0;

void process_file(const char *filename)
{
    printf("Processing file: %s\n", filename);

    const char *ext = strrchr(filename, '.');
    if (ext == NULL)
    {
        return;
    }

    if (strcmp(ext, ".py") == 0)
    {
        int pid = fork();
        if (pid == 0)
        {
            execlp("autopep8", " ", "--in-place", "--aggressive", "--aggressive", filename, (char *)NULL);
            exit(1);
        }
        else if (pid > 0)
        {
            wait(NULL);
        }
    }
    else if (strcmp(ext, ".c") == 0 || strcmp(ext, ".cpp") == 0)
    {
        printf("for cpp idk\n");
    }
    else
    {
        return;
    }
 
}

void *handle_client(void *arg)
{
    thread_counter++;
    int client_sock = *(int *)arg;
    free(arg);

    char buffer[BUFFER_SIZE];
    ssize_t bytes_received = recv(client_sock, buffer, 40, 0); //get the filename from the client
    
    if (bytes_received <= 0)
    {
        perror("recv filename");
        close(client_sock);
        return NULL;
    }

    buffer[bytes_received] = '\0';

    char filename[BUFFER_SIZE];
    snprintf(filename, sizeof(buffer), "%d.%s", thread_counter, buffer);
    printf("%s\n",filename);

    printf("Receiving file: %s\n", filename);

    FILE *file = fopen(filename, "wb");
    if (!file)
    {
        perror("fopen");
        close(client_sock);
        return NULL;
    }

    while ((bytes_received = recv(client_sock, buffer, BUFFER_SIZE, 0)) > 0) //get the content of the file and write it in a new file
    {
        printf("%s", buffer);
        fwrite(buffer, 1, bytes_received, file);
    }

    if (bytes_received < 0)
    {
        perror("recv file");
    }

    fclose(file);

    process_file(filename);

    file = fopen(filename, "rb");
    if (!file)
    {
        perror("fopen");
        close(client_sock);
        return NULL;
    }

    while ((bytes_received = fread(buffer, 1, BUFFER_SIZE, file)) > 0) //read from file and send to client
    {
        size_t total_sent = 0;
        while (total_sent < bytes_received)
        {
            ssize_t sent = send(client_sock, buffer + total_sent, bytes_received - total_sent, 0);
            if (sent < 0)
            {
                perror("send file");
                fclose(file);
                close(client_sock);
                return NULL;
            }
            total_sent += sent;
        }
    }

    if (ferror(file))
    {
        perror("fread file");
    }

    fclose(file);
    close(client_sock);
    thread_counter--;
    return NULL;
}

int main()
{
    int server_sock, client_sock;
    struct sockaddr_in server_addr, client_addr;
    socklen_t addr_len = sizeof(client_addr);

    server_sock = socket(AF_INET, SOCK_STREAM, 0);
    if (server_sock < 0)
    {
        perror("socket");
        return EXIT_FAILURE;
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(PORT);
    server_addr.sin_addr.s_addr = INADDR_ANY;

    if (bind(server_sock, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0)
    {
        perror("bind");
        close(server_sock);
        return EXIT_FAILURE;
    }

    if (listen(server_sock, 5) < 0)
    {
        perror("listen");
        close(server_sock);
        return EXIT_FAILURE;
    }

    printf("Server is listening on port %d...\n", PORT);

    while (1)
    {
        client_sock = accept(server_sock, (struct sockaddr *)&client_addr, &addr_len);
        if (client_sock < 0)
        {
            perror("accept");
            continue;
        }

        int *pclient = malloc(sizeof(int));
        *pclient = client_sock;

        pthread_t thread;
        pthread_create(&thread, NULL, handle_client, pclient);
        pthread_detach(thread);
    }

    close(server_sock);
    return EXIT_SUCCESS;
}
