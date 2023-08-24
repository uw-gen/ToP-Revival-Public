cmake_minimum_required(VERSION 3.26.4)

project(ICUHelper)

set(SOURCE_FILES_DIR "../src")
set(SOURCE_FILES 
${SOURCE_FILES_DIR}/ResourceBundleManage.cpp
${SOURCE_FILES_DIR}/pi_Alloc.cpp
${SOURCE_FILES_DIR}/pi_Memory.cpp
)

add_library(ICUHelper STATIC ${SOURCE_FILES})

target_compile_features(ICUHelper PRIVATE cxx_std_17)

set(DEPENDENY_DIRS "./inc" "../icu/include")
target_include_directories(ICUHelper PRIVATE ${DEPENDENY_DIRS})

set_property(TARGET ICUHelper PROPERTY
  MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")