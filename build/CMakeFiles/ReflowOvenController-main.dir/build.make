# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController\build

# Utility rule file for ReflowOvenController-main.

# Include the progress variables for this target.
include CMakeFiles/ReflowOvenController-main.dir/progress.make

CMakeFiles/ReflowOvenController-main: ReflowOvenController.main


ReflowOvenController.main: ../main.gen
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ReflowOvenController.main"
	cmake -E env "PYTHONPATH=C:/Program Files/SXC/include/libspine/common/script;C:/Program Files/SXC/include/libspine/hardware/script" C:/Users/cchin/AppData/Local/Programs/Python/Python310/python.exe -m cogapp -d -D SRC_DIR=C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController -D BUILD_DIR=C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/build -D "ART0_DIR=C:/Program Files/SXC/include/sxc-art0" -D ART1_DIR= -D NAME=ReflowOvenController -o C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/build/ReflowOvenController.main C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/main.gen

ReflowOvenController-main: CMakeFiles/ReflowOvenController-main
ReflowOvenController-main: ReflowOvenController.main
ReflowOvenController-main: CMakeFiles/ReflowOvenController-main.dir/build.make

.PHONY : ReflowOvenController-main

# Rule to build all files generated by this target.
CMakeFiles/ReflowOvenController-main.dir/build: ReflowOvenController-main

.PHONY : CMakeFiles/ReflowOvenController-main.dir/build

CMakeFiles/ReflowOvenController-main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\ReflowOvenController-main.dir\cmake_clean.cmake
.PHONY : CMakeFiles/ReflowOvenController-main.dir/clean

CMakeFiles/ReflowOvenController-main.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController\build C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController\build C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController\build\CMakeFiles\ReflowOvenController-main.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ReflowOvenController-main.dir/depend

