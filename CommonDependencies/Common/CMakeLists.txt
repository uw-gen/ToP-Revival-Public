cmake_minimum_required(VERSION 3.26.4)

project(Common)

set(SOURCE_FILES_DIR "../src")
set(SOURCE_FILES 
${SOURCE_FILES_DIR}/ChaAttr.cpp
${SOURCE_FILES_DIR}/ChaMask.cpp
${SOURCE_FILES_DIR}/CharacterRecord.cpp
${SOURCE_FILES_DIR}/CommFunc.cpp
${SOURCE_FILES_DIR}/EventRecord.cpp
${SOURCE_FILES_DIR}/ForgeRecord.cpp
${SOURCE_FILES_DIR}/HairRecord.cpp
${SOURCE_FILES_DIR}/i18n.cpp
${SOURCE_FILES_DIR}/ItemAttr.cpp
${SOURCE_FILES_DIR}/ItemContent.cpp
${SOURCE_FILES_DIR}/ItemRecord.cpp
${SOURCE_FILES_DIR}/JobInitEquip.cpp
${SOURCE_FILES_DIR}/Kitbag.cpp
${SOURCE_FILES_DIR}/LevelRecord.cpp
${SOURCE_FILES_DIR}/LifeLvRecord.cpp
${SOURCE_FILES_DIR}/LogFile.cpp
${SOURCE_FILES_DIR}/MonRefRecord.cpp
${SOURCE_FILES_DIR}/NpcRecord.cpp
${SOURCE_FILES_DIR}/SailLvRecord.cpp
${SOURCE_FILES_DIR}/ShipSet.cpp
${SOURCE_FILES_DIR}/SkillRecord.cpp
${SOURCE_FILES_DIR}/SkillStateRecord.cpp
${SOURCE_FILES_DIR}/StringLib.cpp
${SOURCE_FILES_DIR}/SwitchMapRecord.cpp
${SOURCE_FILES_DIR}/TerrainAttrib.cpp
)

add_library(Common STATIC ${SOURCE_FILES})

target_compile_features(Common PRIVATE cxx_std_17)


set(DEPENDENCIES_DIRS
"./include" 
"../server/Sdk/include"
"../util/include"
"../ICUHelper/inc"
"../icu/include"
)
target_include_directories(Common PRIVATE ${DEPENDENCIES_DIRS})

set_property(TARGET Common PROPERTY
  MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")