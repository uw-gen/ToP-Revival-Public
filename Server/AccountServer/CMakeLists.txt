cmake_minimum_required(VERSION 3.26.4)

project(AccountServer)

set(SOURCE_FILES_DIR "../src")
set(SOURCE_FILES 
  ${SOURCE_FILES_DIR}/main.cpp
  ${SOURCE_FILES_DIR}/AccountServer2.cpp
  ${SOURCE_FILES_DIR}/BillService.cpp
  ${SOURCE_FILES_DIR}/BillThread.cpp
  ${SOURCE_FILES_DIR}/BTIService.cpp
  ${SOURCE_FILES_DIR}/DataBaseCtrl.cpp
  ${SOURCE_FILES_DIR}/GlobalVariable.cpp
  ${SOURCE_FILES_DIR}/MyThread.cpp
  ${SOURCE_FILES_DIR}/Player.cpp
  ${SOURCE_FILES_DIR}/PlayerMgr.cpp
  ${SOURCE_FILES_DIR}/TomService.cpp
)


add_executable(AccountServer ${SOURCE_FILES})
target_sources(AccountServer PRIVATE ${SOURCE_FILES_DIR}/AccountServer.rc)

target_compile_features(AccountServer PRIVATE cxx_std_17)

set(DEPENDENCY_DIRS 
  "./include"
  "../../CommonDependencies/Common/include"
  "../../CommonDependencies/Util/include"
  "../../CommonDependencies/Server/sdk/include"
  "../../CommonDependencies/Ipss/include"
  "../../CommonDependencies/ICUHelper/inc"
  "../../CommonDependencies/icu/include"
)
target_include_directories(AccountServer PRIVATE ${DEPENDENCY_DIRS})

set_property(TARGET AccountServer PROPERTY
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

target_link_libraries(AccountServer PRIVATE
  NetworkingSDK 
  ICUHelper 
  UtilLib
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/lib/icudt.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/lib/icuuc.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/lib/icuin.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/Ipss/lib/BTI.lib
  Ws2_32.lib odbc32.lib winmm.lib
)

set_property(TARGET ICUHelper PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugServer>:Debug>"
)

set_property(TARGET UtilLib PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugServer>:Debug>"
)

target_compile_definitions(AccountServer PRIVATE
  $<$<CONFIG:DebugServer>:_CONSOLE>
  $<$<CONFIG:DebugServer>:WIN32>
  $<$<CONFIG:DebugServer>:_DEBUG>
  
  $<$<CONFIG:ReleaseServer>:WIN32>
  $<$<CONFIG:ReleaseServer>:_CONSOLE>
  $<$<CONFIG:ReleaseServer>:NDEBUG>
)

target_compile_options(AccountServer PUBLIC
  "$<$<CONFIG:DebugServer>:/Zi>"
  "$<$<CONFIG:DebugServer>:/Ob0>"
  "$<$<CONFIG:DebugServer>:/Od>"
  "$<$<CONFIG:DebugServer>:/RTC1>"
)   

target_compile_options(ICUHelper PUBLIC
  "$<$<CONFIG:DebugServer>:/Zi>"
  "$<$<CONFIG:DebugServer>:/Ob0>"
  "$<$<CONFIG:DebugServer>:/Od>"
  "$<$<CONFIG:DebugServer>:/RTC1>"
)   

target_compile_options(UtilLib PUBLIC
  "$<$<CONFIG:DebugServer>:/Zi>"
  "$<$<CONFIG:DebugServer>:/Ob0>"
  "$<$<CONFIG:DebugServer>:/Od>"
  "$<$<CONFIG:DebugServer>:/RTC1>"
)   


target_link_options(AccountServer PUBLIC
  "$<$<CONFIG:DebugServer>:/DEBUG:FULL>"
)  

target_precompile_headers(AccountServer PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include/stdafx.h)

set_target_properties(AccountServer PROPERTIES 
  VS_DEBUGGER_WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/$<CONFIGURATION>
  VS_DEBUGGER_COMMAND_ARGUMENTS "AccountServer.cfg"
) 
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT AccountServer)

add_custom_command(TARGET AccountServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../LanguageResource/en_US.res"
  "$<TARGET_FILE_DIR:AccountServer>"
)

add_custom_command(TARGET AccountServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icudt38.dll"
  "$<TARGET_FILE_DIR:AccountServer>"
)

add_custom_command(TARGET AccountServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icuin38.dll"
  "$<TARGET_FILE_DIR:AccountServer>"
)

add_custom_command(TARGET AccountServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icuuc38.dll"
  "$<TARGET_FILE_DIR:AccountServer>"
)

add_custom_command(TARGET AccountServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/Ipss/bin/BTI.dll"
  "$<TARGET_FILE_DIR:AccountServer>"
)

add_custom_command(TARGET AccountServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/AccountServer.cfg"
  "$<TARGET_FILE_DIR:AccountServer>"
)

add_custom_command(TARGET AccountServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/AccountServer.loc"
  "$<TARGET_FILE_DIR:AccountServer>"
)

set(BUILD_TYPE "SERVER")

set(CMAKE_EXE_LINKER_FLAGS_DEBUGSERVER "")
set(CMAKE_EXE_LINKER_FLAGS_RELEASESERVER "")