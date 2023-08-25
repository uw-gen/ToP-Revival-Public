cmake_minimum_required(VERSION 3.26.4)

project(InfoNet)

set(SOURCE_FILES_DIR "../src")
set(SOURCE_FILES 
${SOURCE_FILES_DIR}/InfoNet.cpp
${SOURCE_FILES_DIR}/lock.cpp
${SOURCE_FILES_DIR}/log.cpp
${SOURCE_FILES_DIR}/thread.cpp
)

add_library(InfoNet STATIC ${SOURCE_FILES})

target_compile_features(InfoNet PRIVATE cxx_std_17)

set(DEPENDENCIES_DIRECTORY
"./include" 
)
target_include_directories(InfoNet PRIVATE ${DEPENDENCIES_DIRECTORY})

set_property(TARGET InfoNet PROPERTY
  MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")