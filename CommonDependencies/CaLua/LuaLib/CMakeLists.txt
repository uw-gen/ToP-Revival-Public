cmake_minimum_required(VERSION 3.26.4)

project(LuaLib)

set(SOURCE_FILES_DIR "../Lua/lib")
set(SOURCE_FILES 
${SOURCE_FILES_DIR}/lauxlib.c 
${SOURCE_FILES_DIR}/lbaselib.c
${SOURCE_FILES_DIR}/ldblib.c
${SOURCE_FILES_DIR}/liolib.c
${SOURCE_FILES_DIR}/lmathlib.c
${SOURCE_FILES_DIR}/loadlib.c
${SOURCE_FILES_DIR}/lstrlib.c
${SOURCE_FILES_DIR}/ltablib.c
)

add_library(LuaLib STATIC ${SOURCE_FILES})

set(LUA_DEPENDENCY_DIRECTORY "../include")
target_include_directories(LuaLib PRIVATE ${LUA_DEPENDENCY_DIRECTORY})

set_property(TARGET LuaLib PROPERTY
  MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")