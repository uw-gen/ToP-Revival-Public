cmake_minimum_required(VERSION 3.26.4)

project(VisualMotionD3D)

set(SOURCE_FILES_DIR "../source")
set(SOURCE_FILES 
  ${SOURCE_FILES_DIR}/ViMD3DLib8.cpp
)

add_library(VisualMotionD3D STATIC ${SOURCE_FILES})

target_compile_features(VisualMotionD3D PRIVATE cxx_std_17)

set(DEPENDENCY_DIRS
  "./include"
  "../DirectX8/include"
)
target_include_directories(VisualMotionD3D PRIVATE ${DEPENDENCY_DIRS})


target_compile_definitions(VisualMotionD3D PRIVATE
  $<$<CONFIG:Debug>:_LIB>
  $<$<CONFIG:Debug>:WIN32>
  $<$<CONFIG:Debug>:_DEBUG>
  $<$<CONFIG:Debug>:DIRECT3D_VERSION=0x0800>
  
  $<$<CONFIG:Release>:WIN32>
  $<$<CONFIG:Release>:_LIB>
  $<$<CONFIG:Release>:NDEBUG>
  $<$<CONFIG:Release>:DIRECT3D_VERSION=0x0800>
)

set(BUILD_TYPE "CLIENT")