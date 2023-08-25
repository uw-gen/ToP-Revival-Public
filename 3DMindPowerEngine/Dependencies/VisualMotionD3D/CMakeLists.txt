cmake_minimum_required(VERSION 3.26.4)

project(VisualMotionD3D)

set(SOURCE_FILES_DIR "../source")
set(SOURCE_FILES 
  ${SOURCE_FILES_DIR}/ViMD3DLib9.cpp
)

add_library(VisualMotionD3D STATIC ${SOURCE_FILES})

set(DEPENDENCY_DIRECTORY
  "./include"
)
target_include_directories(VisualMotionD3D PRIVATE ${DEPENDENCY_DIRECTORY})


target_compile_definitions(VisualMotionD3D PRIVATE
  $<$<CONFIG:Debug>:_LIB>
  $<$<CONFIG:Debug>:WIN32>
  $<$<CONFIG:Debug>:_DEBUG>
  $<$<CONFIG:Debug>:DIRECT3D_VERSION=0x0900>
  
  $<$<CONFIG:Release>:WIN32>
  $<$<CONFIG:Release>:_LIB>
  $<$<CONFIG:Release>:NDEBUG>
  $<$<CONFIG:Release>:DIRECT3D_VERSION=0x0900>
)

set(BUILD_TYPE "CLIENT")