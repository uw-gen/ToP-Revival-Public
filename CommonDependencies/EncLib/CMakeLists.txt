cmake_minimum_required(VERSION 3.26.4)

project(EncLib)

set(SOURCE_FILES_DIR "../src")
set(SOURCE_FILES 
${SOURCE_FILES_DIR}/d3des.cpp
${SOURCE_FILES_DIR}/enclib.cpp
)

add_library(EncLib STATIC ${SOURCE_FILES})

target_compile_features(EncLib PRIVATE cxx_std_17)

set(DEPENDENCY_DIRECTORY "./include")
target_include_directories(EncLib PRIVATE ${DEPENDENCY_DIRECTORY})

set_property(TARGET EncLib PROPERTY
  MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")