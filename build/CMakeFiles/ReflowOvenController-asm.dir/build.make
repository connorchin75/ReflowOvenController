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

# Utility rule file for ReflowOvenController-asm.

# Include the progress variables for this target.
include CMakeFiles/ReflowOvenController-asm.dir/progress.make

CMakeFiles/ReflowOvenController-asm: code.asm
CMakeFiles/ReflowOvenController-asm: data.asm


code.asm: ReflowOvenController.s
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating code.asm, data.asm"
	"C:\Program Files\SXC\bin\sxca.exe" -i C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/build/ReflowOvenController.s -c C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/build/code.asm -d C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/build/data.asm

data.asm: code.asm
	@$(CMAKE_COMMAND) -E touch_nocreate data.asm

ReflowOvenController.s: ReflowOvenController.opt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating ReflowOvenController.s"
	"C:\Program Files\SXC\bin\sxc-none-eabi-llc.exe" C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/build/ReflowOvenController.opt -O3 -o C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/build/ReflowOvenController.s

ReflowOvenController.opt: ReflowOvenController.a
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating ReflowOvenController.opt"
	"C:\Program Files\SXC\bin\sxc-none-eabi-opt.exe" C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/build/ReflowOvenController.a -o C:/Users/cchin/CapstoneFirmware/Xinc2/ReflowOvenController/build/ReflowOvenController.opt -O3 -std-link-opts -loweratomic -unroll-threshold 20 -inline-threshold 15

ReflowOvenController-asm: CMakeFiles/ReflowOvenController-asm
ReflowOvenController-asm: code.asm
ReflowOvenController-asm: data.asm
ReflowOvenController-asm: ReflowOvenController.s
ReflowOvenController-asm: ReflowOvenController.opt
ReflowOvenController-asm: CMakeFiles/ReflowOvenController-asm.dir/build.make

.PHONY : ReflowOvenController-asm

# Rule to build all files generated by this target.
CMakeFiles/ReflowOvenController-asm.dir/build: ReflowOvenController-asm

.PHONY : CMakeFiles/ReflowOvenController-asm.dir/build

CMakeFiles/ReflowOvenController-asm.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\ReflowOvenController-asm.dir\cmake_clean.cmake
.PHONY : CMakeFiles/ReflowOvenController-asm.dir/clean

CMakeFiles/ReflowOvenController-asm.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController\build C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController\build C:\Users\cchin\CapstoneFirmware\Xinc2\ReflowOvenController\build\CMakeFiles\ReflowOvenController-asm.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ReflowOvenController-asm.dir/depend

