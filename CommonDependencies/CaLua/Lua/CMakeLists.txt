cmake_minimum_required(VERSION 3.26.4)

project(Lua50)
set(SOURCE_FILES_DIR "./")

set(SOURCE_FILES 
${SOURCE_FILES_DIR}/lapi.c
${SOURCE_FILES_DIR}/lcode.c
${SOURCE_FILES_DIR}/ldebug.c
${SOURCE_FILES_DIR}/ldo.c
${SOURCE_FILES_DIR}/ldump.c
${SOURCE_FILES_DIR}/lfunc.c
${SOURCE_FILES_DIR}/lgc.c
${SOURCE_FILES_DIR}/llex.c
${SOURCE_FILES_DIR}/lmem.c
${SOURCE_FILES_DIR}/lobject.c
${SOURCE_FILES_DIR}/lopcodes.c
${SOURCE_FILES_DIR}/lparser.c
${SOURCE_FILES_DIR}/lstate.c
${SOURCE_FILES_DIR}/lstring.c
${SOURCE_FILES_DIR}/ltable.c
${SOURCE_FILES_DIR}/ltests.c
${SOURCE_FILES_DIR}/ltm.c
${SOURCE_FILES_DIR}/lundump.c
${SOURCE_FILES_DIR}/lvm.c
${SOURCE_FILES_DIR}/lzio.c
)

add_library(Lua50 STATIC ${SOURCE_FILES})

set(LUA_DEPENDENCY_DIRECTORY "../include")
target_include_directories(Lua50 PRIVATE ${LUA_DEPENDENCY_DIRECTORY})

set_property(TARGET Lua50 PROPERTY
  MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")