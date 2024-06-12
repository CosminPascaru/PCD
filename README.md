
### Documentation for the C Programs: Server and Client

#### Introduction
These two C programs demonstrate a simple client-server model where the client sends files to the server for processing. The server receives the files, processes them based on their extensions, and sends back the processed file to the client. This documentation will help beginners understand the structure and functionality of both the server and client programs.

### Server Program (`server.c`)

#### Overview
The server program listens for incoming connections from clients, receives files, processes them based on their extensions, and sends back the processed files.

#### Key Components

1. **Libraries**:
   - Standard libraries for input/output, string manipulation, and process control.
   - Networking libraries (`arpa/inet.h`, `sys/socket.h`) for socket programming.
   - Thread library (`pthread.h`) for handling multiple clients concurrently.

2. **Constants**:
   - `PORT`: The port number the server listens on (8080).
   - `BUFFER_SIZE`: The size of the buffer used for reading and writing data (1024 bytes).

3. **Global Variables**:
   - `thread_counter`: An atomic integer to count threads for uniquely naming files.

4. **Functions**:
   - `process_file(const char *filename)`: Processes files based on their extension (`.py` or others) using external tools (`autopep8` for Python files and `astyle` for others).
   - `handle_client(void *arg)`: Handles communication with a client, including receiving and processing files, and sending back the processed files.

5. **Main Function**:
   - Sets up the server socket and listens for incoming connections.
   - Creates a new thread for each incoming client connection to handle file transfer and processing.

#### Code Explanation

- **Initialization**:
  - Create a socket and bind it to the specified port.
  - Listen for incoming connections with a maximum backlog of 10.

- **Client Handling**:
  - Accept client connections and create a new thread for each client.
  - In the thread, receive the filename and file content from the client.
  - Process the file based on its extension and send the processed file back to the client.

### Client Program (`client.c`)

#### Overview
The client program connects to the server, sends files for processing, and receives the processed files from the server.

#### Key Components

1. **Libraries**:
   - Standard libraries for input/output and string manipulation.
   - Networking libraries (`arpa/inet.h`, `sys/socket.h`) for socket programming.

2. **Constants**:
   - `PORT`: The port number the server listens on (8080).
   - `BUFFER_SIZE`: The size of the buffer used for reading and writing data (1024 bytes).

3. **Functions**:
   - `is_valid_extension(const char *filename)`: Checks if the file has a valid extension (`.py`, `.c`, or `.cpp`).
   - `send_file_to_server(int sock, const char *filename)`: Sends a file to the server and receives the processed file.

4. **Main Function**:
   - Iterates over the provided filenames, checks their extensions, and sends valid files to the server.

#### Code Explanation

- **File Validation**:
  - Ensure the file has a valid extension before attempting to send it to the server.

- **Connection Setup**:
  - Create a socket and connect to the server at `127.0.0.1` on the specified port.

- **File Transfer**:
  - Send the filename and file content to the server.
  - Receive the processed file from the server and save it with a temporary name.

### Running the Programs

#### Server
1. Compile the server program:
   ```sh
   gcc -o server server.c -lpthread
   ```
2. Run the server program:
   ```sh
   ./server
   ```

#### Client
1. Compile the client program:
   ```sh
   gcc -o client client.c
   ```
2. Run the client program with filenames as arguments:
   ```sh
   ./client sample.py sample.c
   ```

### Conclusion
These programs demonstrate a basic client-server architecture using C and socket programming. The server handles multiple clients concurrently using threads, and the client sends files for processing based on their extensions. The server processes the files using external tools and returns the processed files to the client.
