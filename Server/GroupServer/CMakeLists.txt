cmake_minimum_required(VERSION 3.26.4)

project(GroupServer)

set(SOURCE_FILES_DIR "../src")
set(SOURCE_FILES 
  ${SOURCE_FILES_DIR}/GroupSMain.cpp
  ${SOURCE_FILES_DIR}/TeamMember.cpp
  ${SOURCE_FILES_DIR}/Team.cpp
  ${SOURCE_FILES_DIR}/SessionChat.cpp
  ${SOURCE_FILES_DIR}/Script.cpp
  ${SOURCE_FILES_DIR}/Player.cpp
  ${SOURCE_FILES_DIR}/Parser.cpp
  ${SOURCE_FILES_DIR}/Master.cpp
  ${SOURCE_FILES_DIR}/LuaFunc.cpp
  ${SOURCE_FILES_DIR}/Invitation.cpp
  ${SOURCE_FILES_DIR}/GuildMember.cpp
  ${SOURCE_FILES_DIR}/Guild.cpp
  ${SOURCE_FILES_DIR}/GroupServerAppTeam.cpp
  ${SOURCE_FILES_DIR}/GroupServerAppServ.cpp
  ${SOURCE_FILES_DIR}/GroupServerAppPrsn.cpp
  ${SOURCE_FILES_DIR}/GroupServerAppMaster.cpp
  ${SOURCE_FILES_DIR}/GroupServerAppInit.cpp
  ${SOURCE_FILES_DIR}/GroupServerAppGuld.cpp
  ${SOURCE_FILES_DIR}/GroupServerAppFrnd.cpp
  ${SOURCE_FILES_DIR}/GroupServerAppChat.cpp
  ${SOURCE_FILES_DIR}/GroupServerApp.cpp
  ${SOURCE_FILES_DIR}/Friend.cpp
  ${SOURCE_FILES_DIR}/DBConnect.cpp
)

add_executable(GroupServer ${SOURCE_FILES})

target_compile_features(GroupServer PRIVATE cxx_std_17)

set(DEPENDENCY_DIRS 
  "./include"
  "../../CommonDependencies/Server/sdk/include"
  "../../CommonDependencies/Util/include"
  "../../CommonDependencies/Common/include"
  "../../CommonDependencies/ICUHelper/inc"
  "../../CommonDependencies/icu/include"
  "../../CommonDependencies/CaLua/include"
)
target_include_directories(GroupServer PRIVATE ${DEPENDENCY_DIRS})

set_property(TARGET GroupServer PROPERTY
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
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/CaLua/Lua
  ${CMAKE_CURRENT_SOURCE_DIR}../../../CommonDependencies/CaLua/Lua/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/CaLua/LuaLib
  ${CMAKE_CURRENT_SOURCE_DIR}../../../CommonDependencies/CaLua/LuaLib/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/Common
  ${CMAKE_CURRENT_SOURCE_DIR}../../../CommonDependencies/Common/build/
)

target_link_libraries(GroupServer PRIVATE
  NetworkingSDK 
  ICUHelper 
  UtilLib
  Lua50
  LuaLib
  Common
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

set_property(TARGET Lua50 PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugServer>:Debug>"
)

set_property(TARGET LuaLib PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugServer>:Debug>"
)

set_property(TARGET Common PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugServer>:Debug>"
)

target_compile_definitions(GroupServer PRIVATE
  $<$<CONFIG:DebugServer>:_CONSOLE>
  $<$<CONFIG:DebugServer>:WIN32>
  $<$<CONFIG:DebugServer>:_DEBUG>
  
  $<$<CONFIG:ReleaseServer>:WIN32>
  $<$<CONFIG:ReleaseServer>:_CONSOLE>
  $<$<CONFIG:ReleaseServer>:NDEBUG>
)

target_compile_options(GroupServer PUBLIC
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

target_compile_options(Lua50 PUBLIC
  "$<$<CONFIG:DebugServer>:/Zi>"
  "$<$<CONFIG:DebugServer>:/Ob0>"
  "$<$<CONFIG:DebugServer>:/Od>"
  "$<$<CONFIG:DebugServer>:/RTC1>"
)   

target_compile_options(LuaLib PUBLIC
  "$<$<CONFIG:DebugServer>:/Zi>"
  "$<$<CONFIG:DebugServer>:/Ob0>"
  "$<$<CONFIG:DebugServer>:/Od>"
  "$<$<CONFIG:DebugServer>:/RTC1>"
)   

target_compile_options(Common PUBLIC
  "$<$<CONFIG:DebugServer>:/Zi>"
  "$<$<CONFIG:DebugServer>:/Ob0>"
  "$<$<CONFIG:DebugServer>:/Od>"
  "$<$<CONFIG:DebugServer>:/RTC1>"
)   


target_link_options(GroupServer PUBLIC
  "$<$<CONFIG:DebugServer>:/DEBUG:FULL>"
)  


set_target_properties(GroupServer PROPERTIES 
  VS_DEBUGGER_WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/$<CONFIGURATION>
  VS_DEBUGGER_COMMAND_ARGUMENTS "GroupServer.cfg"
) 
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT GroupServer)

add_custom_command(TARGET GroupServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../LanguageResource/en_US.res"
  "$<TARGET_FILE_DIR:GroupServer>"
)

add_custom_command(TARGET GroupServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icudt38.dll"
  "$<TARGET_FILE_DIR:GroupServer>"
)

add_custom_command(TARGET GroupServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icuin38.dll"
  "$<TARGET_FILE_DIR:GroupServer>"
)

add_custom_command(TARGET GroupServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icuuc38.dll"
  "$<TARGET_FILE_DIR:GroupServer>"
)

add_custom_command(TARGET GroupServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/GroupServer.cfg"
  "$<TARGET_FILE_DIR:GroupServer>"
)

add_custom_command(TARGET GroupServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/GroupServer.loc"
  "$<TARGET_FILE_DIR:GroupServer>"
)

add_custom_command(TARGET GroupServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/Script01.lua"
  "$<TARGET_FILE_DIR:GroupServer>/resource/script/Script01.lua"
)

set(BUILD_TYPE "SERVER")

set(CMAKE_EXE_LINKER_FLAGS_DEBUGSERVER "")
set(CMAKE_EXE_LINKER_FLAGS_RELEASESERVER "")