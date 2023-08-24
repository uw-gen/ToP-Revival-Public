cmake_minimum_required(VERSION 3.26.4)

project(AudioSDL)

set(SOURCE_FILES_DIR "../src")
set(SOURCE_FILES ${SOURCE_FILES_DIR}/AudioSDL.cpp ${SOURCE_FILES_DIR}/AudioResource.cpp ${SOURCE_FILES_DIR}/lock.cpp ${SOURCE_FILES_DIR}/SDL_Wrapper.cpp)

add_library(AudioSDL STATIC ${SOURCE_FILES})

target_compile_features(AudioSDL PRIVATE cxx_std_17)

set(SDL_DEPENDENCY_DIRECTORY "./inc" "../SDL-1.2.7/INCLUDE")
target_include_directories(AudioSDL PRIVATE ${SDL_DEPENDENCY_DIRECTORY})

set_property(TARGET AudioSDL PROPERTY
  MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")