cmake_minimum_required(VERSION 3.26.4)

project(GameServer)

set(SOURCE_FILES_DIR "../src")
set(SOURCE_FILES 
  ${SOURCE_FILES_DIR}/GameSMain.cpp
  ${SOURCE_FILES_DIR}/Action.cpp
  ${SOURCE_FILES_DIR}/Attachable.cpp
  ${SOURCE_FILES_DIR}/AttachManage.cpp
  ${SOURCE_FILES_DIR}/Auction.cpp
  ${SOURCE_FILES_DIR}/AuctionItem.cpp
  ${SOURCE_FILES_DIR}/Birthplace.cpp
  ${SOURCE_FILES_DIR}/cfl_iocp.cpp
  ${SOURCE_FILES_DIR}/cfl_lock.cpp
  ${SOURCE_FILES_DIR}/Character.cpp
  ${SOURCE_FILES_DIR}/CharacterAI.cpp
  ${SOURCE_FILES_DIR}/CharacterAIState.cpp
  ${SOURCE_FILES_DIR}/CharacterCmd.cpp
  ${SOURCE_FILES_DIR}/CharacterPacket.cpp
  ${SOURCE_FILES_DIR}/CharacterPrl.cpp
  ${SOURCE_FILES_DIR}/CharacterRun.cpp
  ${SOURCE_FILES_DIR}/CharacterSuperCmd.cpp
  ${SOURCE_FILES_DIR}/CharBoat.cpp
  ${SOURCE_FILES_DIR}/CharForge.cpp
  ${SOURCE_FILES_DIR}/CharScript.cpp
  ${SOURCE_FILES_DIR}/CharStall.cpp
  ${SOURCE_FILES_DIR}/CharTrade.cpp
  ${SOURCE_FILES_DIR}/Config.cpp
  ${SOURCE_FILES_DIR}/Entity.cpp
  ${SOURCE_FILES_DIR}/EntityAlloc.cpp
  ${SOURCE_FILES_DIR}/EntityScript.cpp
  ${SOURCE_FILES_DIR}/EntitySpawn.cpp
  ${SOURCE_FILES_DIR}/EventCalculate.cpp
  ${SOURCE_FILES_DIR}/EventEntity.cpp
  ${SOURCE_FILES_DIR}/EventHandler.cpp
  ${SOURCE_FILES_DIR}/EyeshotCell.cpp
  ${SOURCE_FILES_DIR}/FightAble.cpp
  ${SOURCE_FILES_DIR}/FindPath.cpp
  ${SOURCE_FILES_DIR}/GameApp.cpp
  ${SOURCE_FILES_DIR}/GameAppNet.cpp
  ${SOURCE_FILES_DIR}/GameDB.cpp
  ${SOURCE_FILES_DIR}/GameServerApp.cpp
  ${SOURCE_FILES_DIR}/gmsvr.cpp
  ${SOURCE_FILES_DIR}/Guild.cpp
  ${SOURCE_FILES_DIR}/HarmRec.cpp
  ${SOURCE_FILES_DIR}/Item.cpp
  ${SOURCE_FILES_DIR}/lua_gamectrl.cpp
  ${SOURCE_FILES_DIR}/MapEntry.cpp
  ${SOURCE_FILES_DIR}/MapRes.cpp
  ${SOURCE_FILES_DIR}/MapTrigger.cpp
  # ${SOURCE_FILES_DIR}/MgrUnit.cpp
  ${SOURCE_FILES_DIR}/Mission.cpp
  ${SOURCE_FILES_DIR}/MoveAble.cpp
  ${SOURCE_FILES_DIR}/NPC.cpp
  ${SOURCE_FILES_DIR}/NpcScript.cpp
  # ${SOURCE_FILES_DIR}/OuterServer.cpp
  ${SOURCE_FILES_DIR}/Parser.cpp
  ${SOURCE_FILES_DIR}/PicSet.cpp
  ${SOURCE_FILES_DIR}/Picture.cpp
  ${SOURCE_FILES_DIR}/Player.cpp
  ${SOURCE_FILES_DIR}/Script.cpp
  ${SOURCE_FILES_DIR}/StackWalker.cpp
  ${SOURCE_FILES_DIR}/StateCell.cpp
  ${SOURCE_FILES_DIR}/SubMap.cpp
  ${SOURCE_FILES_DIR}/SystemDialog.cpp
  ${SOURCE_FILES_DIR}/TradeLogDB.cpp
  ${SOURCE_FILES_DIR}/Weather.cpp
  ${SOURCE_FILES_DIR}/WorldEudemon.cpp
  ${SOURCE_FILES_DIR}/xString.cpp
)

add_executable(GameServer ${SOURCE_FILES})
target_sources(GameServer PRIVATE ${SOURCE_FILES_DIR}/GameServer.rc)

set(DEPENDENCY_DIRS 
  "./include"
  "../../CommonDependencies/Server/sdk/include"
  "../../CommonDependencies/Common/include"
  "../../CommonDependencies/Util/include"
  "../../CommonDependencies/ICUHelper/inc"
  "../../CommonDependencies/icu/include"
  "../../CommonDependencies/CaLua/include"
)
target_include_directories(GameServer PRIVATE ${DEPENDENCY_DIRS})

set_property(TARGET GameServer PROPERTY
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
add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/InfoNet
  ${CMAKE_CURRENT_SOURCE_DIR}../../../CommonDependencies/InfoNet/build/
)

target_link_libraries(GameServer PRIVATE
  NetworkingSDK 
  ICUHelper 
  UtilLib
  Lua50
  LuaLib
  Common
  InfoNet
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/lib/icudt.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/lib/icuuc.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/lib/icuin.lib
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

set_property(TARGET InfoNet PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugServer>:Debug>"
)

target_compile_definitions(GameServer PRIVATE
  $<$<CONFIG:DebugServer>:_CONSOLE>
  $<$<CONFIG:DebugServer>:WIN32>
  $<$<CONFIG:DebugServer>:_DEBUG>
  
  $<$<CONFIG:ReleaseServer>:WIN32>
  $<$<CONFIG:ReleaseServer>:_CONSOLE>
  $<$<CONFIG:ReleaseServer>:NDEBUG>
)

target_compile_options(GameServer PUBLIC
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

target_compile_options(InfoNet PUBLIC
  "$<$<CONFIG:DebugServer>:/Zi>"
  "$<$<CONFIG:DebugServer>:/Ob0>"
  "$<$<CONFIG:DebugServer>:/Od>"
  "$<$<CONFIG:DebugServer>:/RTC1>"
)   


target_link_options(GameServer PUBLIC
  "$<$<CONFIG:DebugServer>:/DEBUG:FULL>"
)  

set_target_properties(GameServer PROPERTIES 
  VS_DEBUGGER_WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/$<CONFIGURATION>
  VS_DEBUGGER_COMMAND_ARGUMENTS "GameServer.cfg"
) 
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT GameServer)

add_custom_command(TARGET GameServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../LanguageResource/en_US.res"
  "$<TARGET_FILE_DIR:GameServer>"
)

add_custom_command(TARGET GameServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/GameServer.cfg"
  "$<TARGET_FILE_DIR:GameServer>"
)

add_custom_command(TARGET GameServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/ChaNameFilter.txt"
  "$<TARGET_FILE_DIR:GameServer>/resource/ChaNameFilter.txt"
)

add_custom_command(TARGET GameServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icuuc38.dll"
  "$<TARGET_FILE_DIR:GameServer>"
)

add_custom_command(TARGET GameServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icuin38.dll"
  "$<TARGET_FILE_DIR:GameServer>"
)

add_custom_command(TARGET GameServer POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../../CommonDependencies/icu/bin/icudt38.dll"
  "$<TARGET_FILE_DIR:GameServer>"
)


set(BUILD_TYPE "SERVER")

set(CMAKE_EXE_LINKER_FLAGS_DEBUGSERVER "")
set(CMAKE_EXE_LINKER_FLAGS_RELEASESERVER "")