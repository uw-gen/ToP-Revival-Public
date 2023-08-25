cmake_minimum_required(VERSION 3.26.4)

project(GateServer)

set(SOURCE_FILES_DIR "../src")
set(SOURCE_FILES 
  ${SOURCE_FILES_DIR}/main.cpp
  ${SOURCE_FILES_DIR}/GateServer.cpp
  ${SOURCE_FILES_DIR}/ToClient.cpp
  ${SOURCE_FILES_DIR}/ToGameServer.cpp
  ${SOURCE_FILES_DIR}/ToGroupServer.cpp
)

add_executable(GateServer ${SOURCE_FILES})

target_compile_features(GateServer PRIVATE cxx_std_17)

set(DEPENDENCY_DIRS 
  "./include"
  "../../CommonDependencies/Server/sdk/include"
  "../../CommonDependencies/Common/include"
  "../../CommonDependencies/Util/include"
  "../../CommonDependencies/Status/include"
  "../../CommonDependencies/ICUHelper/inc"
  "../../CommonDependencies/icu/include"
)
target_include_directories(GateServer PRIVATE ${DEPENDENCY_DIRS})


set_property(TARGET GateServer PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugServer>:Debug>"
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/Server/sdk
  ${CMAKE_CURRENT_SOURCE_DIR}../../CommonDependencies/Server/sdk/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/ICUHelper/
  ${CMAKE_CURRENT_SOURCE_DIR}../../../CommonDependencies/ICUHelper/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/Util/
  ${CMAKE_CURRENT_SOURCE_DIR}../../../CommonDependencies/Util/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/Status/
  ${CMAKE_CURRENT_SOURCE_DIR}../../../CommonDependencies/Status/build/
)

target_link_libraries(GateServer PRIVATE
  NetworkingSDK 
  ICUHelper 
  UtilLib
  StatusLib
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/lib/icudt.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/lib/icuuc.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/lib/icuin.lib
  Ws2_32.lib odbc32.lib winmm.lib shlwapi.lib
)

set_property(TARGET ICUHelper PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugServer>:Debug>"
)

set_property(TARGET UtilLib PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugServer>:Debug>"
)

set_property(TARGET StatusLib PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugServer>:Debug>"
)

target_compile_definitions(GateServer PRIVATE
  $<$<CONFIG:DebugServer>:_CONSOLE>
  $<$<CONFIG:DebugServer>:WIN32>
  $<$<CONFIG:DebugServer>:_DEBUG>
  
  $<$<CONFIG:ReleaseServer>:WIN32>
  $<$<CONFIG:ReleaseServer>:_CONSOLE>
  $<$<CONFIG:ReleaseServer>:NDEBUG>
)

target_link_options(GateServer PUBLIC
  "$<$<CONFIG:DebugServer>:/DEBUG:FULL>"
)  

set_target_properties(GateServer PROPERTIES 
  VS_DEBUGGER_WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/$<CONFIGURATION>
  VS_DEBUGGER_COMMAND_ARGUMENTS "GateServer.cfg"
) 
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT GateServer)

add_custom_command(TARGET GateServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../LanguageResource/en_US.res"
  "$<TARGET_FILE_DIR:GateServer>"
)

add_custom_command(TARGET GateServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icudt38.dll"
  "$<TARGET_FILE_DIR:GateServer>"
)

add_custom_command(TARGET GateServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icuin38.dll"
  "$<TARGET_FILE_DIR:GateServer>"
)

add_custom_command(TARGET GateServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icuuc38.dll"
  "$<TARGET_FILE_DIR:GateServer>"
)

add_custom_command(TARGET GateServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/GateServer.cfg"
  "$<TARGET_FILE_DIR:GateServer>"
)

add_custom_command(TARGET GateServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/GateServer.loc"
  "$<TARGET_FILE_DIR:GateServer>"
)

set(BUILD_TYPE "SERVER")

set(CMAKE_EXE_LINKER_FLAGS_DEBUGSERVER "")
set(CMAKE_EXE_LINKER_FLAGS_RELEASESERVER "")