import socket
import os

PORT = 8080
BUFFER_SIZE = 1024

def is_valid_extension(filename):
    ext = os.path.splitext(filename)[1]
    return ext in ['.c', '.cpp', '.py']

def send_file_to_server(sock, filename):
    try:
        with open(filename, 'rb') as file:
            padded_filename = filename.encode().ljust(40)
            sock.sendall(padded_filename)

            # Send the file content
            while True:
                bytes_read = file.read(BUFFER_SIZE)
                if not bytes_read:
                    break
                sock.sendall(bytes_read)

        sock.shutdown(socket.SHUT_WR)

        output_filename = f"{filename}.temp"
        with open(output_filename, 'wb') as output_file:
            while True:
                bytes_received = sock.recv(BUFFER_SIZE)
                if not bytes_received:
                    break
                output_file.write(bytes_received)

        print(f"File received and written to {output_filename}")
    except Exception as e:
        print(f"Error: {e}")

def main(filenames):
    for filename in filenames:
        if is_valid_extension(filename):
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
                server_address = ('localhost', PORT)
                sock.connect(server_address)
                send_file_to_server(sock, filename)
        else:
            print(f"Invalid file extension: {filename}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <filename1> <filename2> ...")
    else:
        main(sys.argv[1:])
