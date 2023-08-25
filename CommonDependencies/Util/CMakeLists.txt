cmake_minimum_required(VERSION 3.26.4)

project(UtilLib)

set(SOURCE_FILES_DIR "${CMAKE_CURRENT_SOURCE_DIR}../src")
set(SOURCE_FILES 
${SOURCE_FILES_DIR}/algo.cpp
${SOURCE_FILES_DIR}/Big5.cpp
${SOURCE_FILES_DIR}/bill.cpp
${SOURCE_FILES_DIR}/db.cpp
${SOURCE_FILES_DIR}/db3.cpp
${SOURCE_FILES_DIR}/English.cpp
${SOURCE_FILES_DIR}/ErrorHandler.cpp
${SOURCE_FILES_DIR}/GB2312.cpp
${SOURCE_FILES_DIR}/LanguageRecord.cpp
${SOURCE_FILES_DIR}/log.cpp
${SOURCE_FILES_DIR}/log2.cpp
${SOURCE_FILES_DIR}/logutil.cpp
${SOURCE_FILES_DIR}/MapDataVer.cpp
${SOURCE_FILES_DIR}/MapUtil.cpp
${SOURCE_FILES_DIR}/packet.cpp
${SOURCE_FILES_DIR}/pch.cpp
${SOURCE_FILES_DIR}/playsound.cpp
${SOURCE_FILES_DIR}/se_translator.cpp
${SOURCE_FILES_DIR}/SectionData.cpp
${SOURCE_FILES_DIR}/Stacktrace.cpp
${SOURCE_FILES_DIR}/sym_engine.cpp
${SOURCE_FILES_DIR}/util2.cpp

${SOURCE_FILES_DIR}/md5c.c
)

add_library(UtilLib STATIC ${SOURCE_FILES})

target_compile_features(UtilLib PRIVATE cxx_std_17)

set(DEPENDENCIES_DIRS
"./include" 
"../ipss/include"
"../sdl-1.2.7/include"
"../enclib/include"
)
target_include_directories(UtilLib PRIVATE ${DEPENDENCIES_DIRS})


set_property(TARGET UtilLib PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:Debug>:Debug>"
)

target_compile_definitions(UtilLib PRIVATE
  $<$<CONFIG:Debug>:_DEBUG>
)