cmake_minimum_required(VERSION 3.26.4)

project(StatusLib)

set(SOURCE_FILES_DIR "../src")
set(SOURCE_FILES 
${SOURCE_FILES_DIR}/UdpClient.cpp
${SOURCE_FILES_DIR}/UdpManage.cpp
${SOURCE_FILES_DIR}/UdpSocket.cpp
)

add_library(StatusLib STATIC ${SOURCE_FILES})

target_compile_features(StatusLib PRIVATE cxx_std_17)

set(DEPENDENCY_DIRECTORY "./Include")
target_include_directories(StatusLib PRIVATE ${DEPENDENCY_DIRECTORY})

set_property(TARGET StatusLib PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:Debug>:Debug>"
)

target_compile_definitions(StatusLib PRIVATE
  $<$<CONFIG:Debug>:_DEBUG>
)
