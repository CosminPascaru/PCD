# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cosmin/vscode/pcd/PCD

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cosmin/vscode/pcd/PCD

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/cosmin/vscode/pcd/PCD/CMakeFiles /home/cosmin/vscode/pcd/PCD//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/cosmin/vscode/pcd/PCD/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named server

# Build rule for target.
server: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 server
.PHONY : server

# fast build rule for target.
server/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/build
.PHONY : server/fast

#=============================================================================
# Target rules for targets named client

# Build rule for target.
client: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 client
.PHONY : client

# fast build rule for target.
client/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/build
.PHONY : client/fast

#=============================================================================
# Target rules for targets named admin

# Build rule for target.
admin: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 admin
.PHONY : admin

# fast build rule for target.
admin/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/admin.dir/build.make CMakeFiles/admin.dir/build
.PHONY : admin/fast

source/admin.o: source/admin.c.o
.PHONY : source/admin.o

# target to build an object file
source/admin.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/admin.dir/build.make CMakeFiles/admin.dir/source/admin.c.o
.PHONY : source/admin.c.o

source/admin.i: source/admin.c.i
.PHONY : source/admin.i

# target to preprocess a source file
source/admin.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/admin.dir/build.make CMakeFiles/admin.dir/source/admin.c.i
.PHONY : source/admin.c.i

source/admin.s: source/admin.c.s
.PHONY : source/admin.s

# target to generate assembly for a file
source/admin.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/admin.dir/build.make CMakeFiles/admin.dir/source/admin.c.s
.PHONY : source/admin.c.s

source/client.o: source/client.c.o
.PHONY : source/client.o

# target to build an object file
source/client.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/source/client.c.o
.PHONY : source/client.c.o

source/client.i: source/client.c.i
.PHONY : source/client.i

# target to preprocess a source file
source/client.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/source/client.c.i
.PHONY : source/client.c.i

source/client.s: source/client.c.s
.PHONY : source/client.s

# target to generate assembly for a file
source/client.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/source/client.c.s
.PHONY : source/client.c.s

source/server.o: source/server.c.o
.PHONY : source/server.o

# target to build an object file
source/server.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/source/server.c.o
.PHONY : source/server.c.o

source/server.i: source/server.c.i
.PHONY : source/server.i

# target to preprocess a source file
source/server.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/source/server.c.i
.PHONY : source/server.c.i

source/server.s: source/server.c.s
.PHONY : source/server.s

# target to generate assembly for a file
source/server.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/source/server.c.s
.PHONY : source/server.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... admin"
	@echo "... client"
	@echo "... server"
	@echo "... source/admin.o"
	@echo "... source/admin.i"
	@echo "... source/admin.s"
	@echo "... source/client.o"
	@echo "... source/client.i"
	@echo "... source/client.s"
	@echo "... source/server.o"
	@echo "... source/server.i"
	@echo "... source/server.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system
