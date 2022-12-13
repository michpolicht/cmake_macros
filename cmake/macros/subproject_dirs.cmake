# Public domain script licensed under terms of "unlicense" (orignal repo: https://github.com/michpolicht/cmake_macros.git).

macro(subproject_dirs RESULT SCAN_DIR)
    # Cannot use ARGN directly with list() command, so copy it to a variable first.
    set (EXTRA_ARGS ${ARGN})

    list(LENGTH EXTRA_ARGS EXTRA_COUNT)
    if (${EXTRA_COUNT} GREATER 0)
        list(GET EXTRA_ARGS 0 RELATIVE_DIR)
    else()
        set(RELATIVE_DIR ${CMAKE_SOURCE_DIR})
    endif()

  file(GLOB children LIST_DIRECTORIES false RELATIVE ${RELATIVE_DIR} ${SCAN_DIR}/*/CMakeLists.txt)
  set(dirlist "")
  foreach(child ${children})
      get_filename_component(dir ${child} DIRECTORY)
      list(APPEND dirlist ${dir})
  endforeach()
  set(${RESULT} ${dirlist})
endmacro()
