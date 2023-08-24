cmake_minimum_required(VERSION 3.26.4)

project(CaLua)

set(SOURCE_FILES_DIR "./CaLua")
set(SOURCE_FILES 
${SOURCE_FILES_DIR}/CaLua_main.c
${SOURCE_FILES_DIR}/CaLua_avltree.c
${SOURCE_FILES_DIR}/CaLua_function.c
${SOURCE_FILES_DIR}/CaLua_hash.c
${SOURCE_FILES_DIR}/CaLua_helper.c
${SOURCE_FILES_DIR}/CaLua_luafuncs.c
${SOURCE_FILES_DIR}/CaLua_parser.c
${SOURCE_FILES_DIR}/CaLua_stack.c
${SOURCE_FILES_DIR}/CaLua_structure.c
${SOURCE_FILES_DIR}/CaLua_vmstack.c
)

add_library(CaLua SHARED ${SOURCE_FILES})

target_compile_features(CaLua PRIVATE cxx_std_17)

set(SDL_DEPENDENCY_DIRECTORY "./include")
target_include_directories(CaLua PRIVATE ${SDL_DEPENDENCY_DIRECTORY})

add_subdirectory(Lua)
add_subdirectory(LuaLib)
target_link_libraries(CaLua PRIVATE Lua50 LuaLib)

if(MSVC)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS TRUE)
endif()