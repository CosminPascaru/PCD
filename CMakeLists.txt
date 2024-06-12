cmake_minimum_required(VERSION 3.0)

project(proiect_pcd)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/build)

add_executable(server source/server.c)
add_executable(client source/client.c)

add_definitions ("-Wall")
add_definitions ("-Wextra")
add_definitions ("-Wstrict-prototypes")
add_definitions ("-Wmissing-prototypes")
add_definitions ("-Wshadow")
add_definitions ("-Wuninitialized")


