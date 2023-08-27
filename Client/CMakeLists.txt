cmake_minimum_required(VERSION 3.26.4)

project(Game)
# ${SOURCE_FILES_DIR}/kop.aps
# ${SOURCE_FILES_DIR}/kop.ico
# ${SOURCE_FILES_DIR}/kop.rc
# ${SOURCE_FILES_DIR}/Character.cpp.org

set(SOURCE_FILES_DIR "../src")
set(SOURCE_FILES 
  ${SOURCE_FILES_DIR}/Actor.cpp
  ${SOURCE_FILES_DIR}/Algo.cpp
  ${SOURCE_FILES_DIR}/AppScript.cpp
  ${SOURCE_FILES_DIR}/ArcTrack.cpp
  ${SOURCE_FILES_DIR}/AudioThread.cpp
  ${SOURCE_FILES_DIR}/AutoAttack.cpp
  ${SOURCE_FILES_DIR}/BassLoader.cpp
  ${SOURCE_FILES_DIR}/BassMusicInterface.cpp
  ${SOURCE_FILES_DIR}/CameraCtrl.cpp
  ${SOURCE_FILES_DIR}/Character.cpp
  ${SOURCE_FILES_DIR}/CharacterAction.cpp
  ${SOURCE_FILES_DIR}/CharacterModel.cpp
  ${SOURCE_FILES_DIR}/ChaScript.cpp
  ${SOURCE_FILES_DIR}/ChaState.cpp
  ${SOURCE_FILES_DIR}/ChatRecord.cpp
  ${SOURCE_FILES_DIR}/Connection.cpp
  ${SOURCE_FILES_DIR}/CRCircle.cpp
  ${SOURCE_FILES_DIR}/CRCursor.cpp
  ${SOURCE_FILES_DIR}/CRCursorObj.cpp
  ${SOURCE_FILES_DIR}/CreateChaScene.cpp
  ${SOURCE_FILES_DIR}/d3des.cpp
  ${SOURCE_FILES_DIR}/DrawPointList.cpp
  ${SOURCE_FILES_DIR}/DSoundInstance.cpp
  ${SOURCE_FILES_DIR}/DSoundManager.cpp
  ${SOURCE_FILES_DIR}/EffDelay.cpp
  ${SOURCE_FILES_DIR}/EffectObj.cpp
  ${SOURCE_FILES_DIR}/Event.cpp
  ${SOURCE_FILES_DIR}/FindPath.cpp
  ${SOURCE_FILES_DIR}/FlashPlayer.cpp
  ${SOURCE_FILES_DIR}/FrndInviteFormMgr.cpp
  ${SOURCE_FILES_DIR}/GameAppFrameMove.cpp
  ${SOURCE_FILES_DIR}/GameAppInit.cpp
  ${SOURCE_FILES_DIR}/GameAppInterface.cpp
  ${SOURCE_FILES_DIR}/GameAppMsg.cpp
  ${SOURCE_FILES_DIR}/GameAppNet.cpp
  ${SOURCE_FILES_DIR}/GameAppRender.cpp
  ${SOURCE_FILES_DIR}/GameConfig.cpp
  ${SOURCE_FILES_DIR}/GameLoading.cpp
  ${SOURCE_FILES_DIR}/GameMovie.cpp
  ${SOURCE_FILES_DIR}/GameWG.cpp
  ${SOURCE_FILES_DIR}/GlobalVar.cpp
  ${SOURCE_FILES_DIR}/GuildData.cpp
  ${SOURCE_FILES_DIR}/GuildListData.cpp
  ${SOURCE_FILES_DIR}/GuildListMgr.cpp
  ${SOURCE_FILES_DIR}/GuildMemberData.cpp
  ${SOURCE_FILES_DIR}/GuildMembersMgr.cpp
  ${SOURCE_FILES_DIR}/HMAttack.cpp
  ${SOURCE_FILES_DIR}/IsSkillUse.cpp
  ${SOURCE_FILES_DIR}/ItemLit.cpp
  ${SOURCE_FILES_DIR}/ItemLitAnim.cpp
  ${SOURCE_FILES_DIR}/Language.cpp
  ${SOURCE_FILES_DIR}/LitLoad.cpp
  ${SOURCE_FILES_DIR}/LoginScene.cpp
  ${SOURCE_FILES_DIR}/lua_platform.cpp
  ${SOURCE_FILES_DIR}/Main.cpp
  ${SOURCE_FILES_DIR}/MouseDown.cpp
  ${SOURCE_FILES_DIR}/MPEditor.cpp
  ${SOURCE_FILES_DIR}/MusicThread.cpp
  ${SOURCE_FILES_DIR}/NetChat.cpp
  ${SOURCE_FILES_DIR}/NetGuild.cpp
  ${SOURCE_FILES_DIR}/NetIF.cpp
  ${SOURCE_FILES_DIR}/NetPkChat.cpp
  ${SOURCE_FILES_DIR}/NetPkGuild.cpp
  ${SOURCE_FILES_DIR}/NetProtocol.cpp
  ${SOURCE_FILES_DIR}/NPCHelper.cpp
  ${SOURCE_FILES_DIR}/PacketCmd_CS.cpp
  ${SOURCE_FILES_DIR}/PacketCmd_SC.cpp
  ${SOURCE_FILES_DIR}/PackFile.cpp
  ${SOURCE_FILES_DIR}/ProCirculateCC.cpp
  ${SOURCE_FILES_DIR}/ProCirculateCS.cpp
  ${SOURCE_FILES_DIR}/RecruitMemberData.cpp
  ${SOURCE_FILES_DIR}/RecruitMembersMgr.cpp
  ${SOURCE_FILES_DIR}/RenderStateMgr.cpp
  ${SOURCE_FILES_DIR}/Scene.cpp
  ${SOURCE_FILES_DIR}/SceneArea.cpp
  ${SOURCE_FILES_DIR}/SceneCreateNode.cpp
  ${SOURCE_FILES_DIR}/SceneFrameMove.cpp
  ${SOURCE_FILES_DIR}/SceneItem.cpp
  ${SOURCE_FILES_DIR}/SceneLight.cpp
  ${SOURCE_FILES_DIR}/SceneMsg.cpp
  ${SOURCE_FILES_DIR}/SceneNode.cpp
  ${SOURCE_FILES_DIR}/SceneObj.cpp
  ${SOURCE_FILES_DIR}/SceneObjFile.cpp
  ${SOURCE_FILES_DIR}/SceneRender.cpp
  ${SOURCE_FILES_DIR}/SceneScript.cpp
  ${SOURCE_FILES_DIR}/SceneSign.cpp
  ${SOURCE_FILES_DIR}/Script.cpp
  ${SOURCE_FILES_DIR}/SelectChaScene.cpp
  ${SOURCE_FILES_DIR}/ShipFactory.cpp
  ${SOURCE_FILES_DIR}/small.ico
  ${SOURCE_FILES_DIR}/SMallMap.cpp
  ${SOURCE_FILES_DIR}/SoundCommon.cpp
  ${SOURCE_FILES_DIR}/state_reading.cpp
  ${SOURCE_FILES_DIR}/STAttack.cpp
  ${SOURCE_FILES_DIR}/stdafx.cpp
  ${SOURCE_FILES_DIR}/SteadyFrame.cpp
  ${SOURCE_FILES_DIR}/STMove.cpp
  ${SOURCE_FILES_DIR}/STNpcTalk.cpp
  ${SOURCE_FILES_DIR}/STPose.cpp
  ${SOURCE_FILES_DIR}/STReadyDie.cpp
  ${SOURCE_FILES_DIR}/STSeat.cpp
  ${SOURCE_FILES_DIR}/STStateObj.cpp
  ${SOURCE_FILES_DIR}/TalkSessionFormMgr.cpp
  ${SOURCE_FILES_DIR}/TeamInviteFormMgr.cpp
  ${SOURCE_FILES_DIR}/TestDemo.cpp
  ${SOURCE_FILES_DIR}/ThreadBase.cpp
  ${SOURCE_FILES_DIR}/Tools.cpp
  ${SOURCE_FILES_DIR}/UI3DCompent.cpp
  ${SOURCE_FILES_DIR}/UIAmphitheaterForm.cpp
  ${SOURCE_FILES_DIR}/UIBankForm.cpp
  ${SOURCE_FILES_DIR}/UIBoatForm.cpp
  ${SOURCE_FILES_DIR}/UIBoothForm.cpp
  ${SOURCE_FILES_DIR}/UIBourseForm.cpp
  ${SOURCE_FILES_DIR}/UIBoxForm.cpp
  ${SOURCE_FILES_DIR}/UIBreakForm.cpp
  ${SOURCE_FILES_DIR}/UIChaInfo.cpp
  ${SOURCE_FILES_DIR}/UIChat.cpp
  ${SOURCE_FILES_DIR}/UICheckBox.cpp
  ${SOURCE_FILES_DIR}/UICheckBoxItem.cpp
  ${SOURCE_FILES_DIR}/UIChurchChallenge.cpp
  ${SOURCE_FILES_DIR}/UICloneForm.cpp
  ${SOURCE_FILES_DIR}/UICombo.cpp
  ${SOURCE_FILES_DIR}/UICommand.cpp
  ${SOURCE_FILES_DIR}/UICommandCompent.cpp
  ${SOURCE_FILES_DIR}/UICompent.cpp
  ${SOURCE_FILES_DIR}/UIComposeForm.cpp
  ${SOURCE_FILES_DIR}/UICookingForm.cpp
  ${SOURCE_FILES_DIR}/UICozeForm.cpp
  ${SOURCE_FILES_DIR}/UICursor.cpp
  ${SOURCE_FILES_DIR}/UIDoublePwdForm.cpp
  ${SOURCE_FILES_DIR}/UIDragTitle.cpp
  ${SOURCE_FILES_DIR}/UIEdit.cpp
  ${SOURCE_FILES_DIR}/UIEditData.cpp
  ${SOURCE_FILES_DIR}/UIEditKey.cpp
  ${SOURCE_FILES_DIR}/UIEditor.cpp
  ${SOURCE_FILES_DIR}/UIEditStrategy.cpp
  ${SOURCE_FILES_DIR}/UIEquipForm.cpp
  ${SOURCE_FILES_DIR}/UIFastCommand.cpp
  ${SOURCE_FILES_DIR}/UIFindTeamForm.cpp
  ${SOURCE_FILES_DIR}/UIFont.cpp
  ${SOURCE_FILES_DIR}/UIForgeForm.cpp
  ${SOURCE_FILES_DIR}/UIForm.cpp
  ${SOURCE_FILES_DIR}/UIFormMgr.cpp
  ${SOURCE_FILES_DIR}/UIFoundForm.cpp
  ${SOURCE_FILES_DIR}/UIGlobalVar.cpp
  ${SOURCE_FILES_DIR}/UIGoodsGrid.cpp
  ${SOURCE_FILES_DIR}/UIGraph.cpp
  ${SOURCE_FILES_DIR}/UIGrid.cpp
  ${SOURCE_FILES_DIR}/UIGuiData.cpp
  ${SOURCE_FILES_DIR}/UIGuildApply.cpp
  ${SOURCE_FILES_DIR}/UIGuildChallengeForm.cpp
  ${SOURCE_FILES_DIR}/UIGuildList.cpp
  ${SOURCE_FILES_DIR}/UIGuildMgr.cpp
  ${SOURCE_FILES_DIR}/UIHaircutForm.cpp
  ${SOURCE_FILES_DIR}/UIHeadSay.cpp
  ${SOURCE_FILES_DIR}/UIImage.cpp
  ${SOURCE_FILES_DIR}/UIImeInput.cpp
  ${SOURCE_FILES_DIR}/UIItem.cpp
  ${SOURCE_FILES_DIR}/UIItemCommand.cpp
  ${SOURCE_FILES_DIR}/UILabel.cpp
  ${SOURCE_FILES_DIR}/UIList.cpp
  ${SOURCE_FILES_DIR}/UIListView.cpp
  ${SOURCE_FILES_DIR}/UILotteryForm.cpp
  ${SOURCE_FILES_DIR}/UIMailForm.cpp
  ${SOURCE_FILES_DIR}/UIMakeEquipForm.cpp
  ${SOURCE_FILES_DIR}/UIMemo.cpp
  ${SOURCE_FILES_DIR}/UIMenu.cpp
  ${SOURCE_FILES_DIR}/UIMinimapForm.cpp
  ${SOURCE_FILES_DIR}/UIMisLogForm.cpp
  ${SOURCE_FILES_DIR}/UIMissionForm.cpp
  ${SOURCE_FILES_DIR}/UINpcTalkForm.cpp
  ${SOURCE_FILES_DIR}/UINpcTradeForm.cpp
  ${SOURCE_FILES_DIR}/UINumAnswer.cpp
  ${SOURCE_FILES_DIR}/UIPage.cpp
  ${SOURCE_FILES_DIR}/UIPicList.cpp
  ${SOURCE_FILES_DIR}/UIPicture.cpp
  ${SOURCE_FILES_DIR}/UIPKDialog.cpp
  ${SOURCE_FILES_DIR}/UIPKSilverForm.cpp
  ${SOURCE_FILES_DIR}/UIProgressBar.cpp
  ${SOURCE_FILES_DIR}/UIPurifyForm.cpp
  ${SOURCE_FILES_DIR}/UIRender.cpp
  ${SOURCE_FILES_DIR}/UIRichEdit.cpp
  ${SOURCE_FILES_DIR}/UIScript.cpp
  ${SOURCE_FILES_DIR}/UIScroll.cpp
  ${SOURCE_FILES_DIR}/UISkillCommand.cpp
  ${SOURCE_FILES_DIR}/UISkillList.cpp
  ${SOURCE_FILES_DIR}/UISpiritForm.cpp
  ${SOURCE_FILES_DIR}/UIStartForm.cpp
  ${SOURCE_FILES_DIR}/UIStateForm.cpp
  ${SOURCE_FILES_DIR}/UIStoreForm.cpp
  ${SOURCE_FILES_DIR}/UISystemForm.cpp
  ${SOURCE_FILES_DIR}/UITeam.cpp
  ${SOURCE_FILES_DIR}/UITextButton.cpp
  ${SOURCE_FILES_DIR}/UITextParse.cpp
  ${SOURCE_FILES_DIR}/UITitle.cpp
  ${SOURCE_FILES_DIR}/UITradeForm.cpp
  ${SOURCE_FILES_DIR}/UITreeView.cpp
  ${SOURCE_FILES_DIR}/WorldScene.cpp
  ${SOURCE_FILES_DIR}/HairTool.cpp
  ${SOURCE_FILES_DIR}/HMManage.cpp
  ${SOURCE_FILES_DIR}/HMSynchroObj.cpp
)

add_executable(Game WIN32 ${SOURCE_FILES})
target_sources(Game PRIVATE ${SOURCE_FILES_DIR}/kop.rc)

target_compile_features(Game PRIVATE cxx_std_14)

set(DEPENDENCY_DIRS 
  "./include"
  "../CommonDependencies/Util/include"
  "../3DMindPowerEngine/Engine/include"
  "../3DMindPowerEngine/Dependencies/DirectX8/include"
  "../CommonDependencies/Common/include"
  "../CommonDependencies/ICUHelper/inc"
  "../CommonDependencies/icu/include"
  "../CommonDependencies/EncLib/include"
  "../CommonDependencies/AudioSDL/inc"
  "../CommonDependencies/CaLua/include"
  "../CommonDependencies/Server/sdk/include"
  "../CommonDependencies/Status/include"
)
target_include_directories(Game PRIVATE ${DEPENDENCY_DIRS})

target_link_directories(Game PRIVATE "../3DMindPowerEngine/Dependencies/DirectX8/lib" "../CommonDependencies/Ipss/lib/")

set_property(TARGET Game PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)

set(BUILD_TYPE "CLIENT")
add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/Server/sdk
  ${CMAKE_CURRENT_SOURCE_DIR}../CommonDependencies/Server/sdk/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/CaLua
  ${CMAKE_CURRENT_SOURCE_DIR}../../CommonDependencies/CaLua/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/AudioSDL
  ${CMAKE_CURRENT_SOURCE_DIR}../../CommonDependencies/AudioSDL/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../3DMindPowerEngine
  ${CMAKE_CURRENT_SOURCE_DIR}../../3DMindPowerEngine/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/Status
  ${CMAKE_CURRENT_SOURCE_DIR}../../CommonDependencies/Status/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/EncLib
  ${CMAKE_CURRENT_SOURCE_DIR}../../CommonDependencies/EncLib/build/
)

target_link_libraries(Game PRIVATE
  UtilLib
  ICUHelper
  Common
  NetworkingSDK
  CaLua
  LuaLib
  Lua50
  AudioSDL
  MindPower3D
  StatusLib
  EncLib
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/icu/lib/icudt.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/icu/lib/icuuc.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/icu/lib/icuin.lib

  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/SDL-1.2.7/lib/SDL.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/SDL-1.2.7/lib/SDL_mixer.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/SDL-1.2.7/lib/SDLmain.lib
  Ws2_32.lib legacy_stdio_definitions.lib ddraw.lib
)

target_compile_definitions(Game PRIVATE
  $<$<CONFIG:DebugClient>:_DEBUG>
  $<$<CONFIG:DebugClient>:_LUA_GAME>
  $<$<CONFIG:DebugClient>:MINDPOWER_USE_DLL>
  $<$<CONFIG:DebugClient>:_WIN32_WINNT=0x0500>
  
  $<$<CONFIG:ReleaseClient>:NDEBUG>
  $<$<CONFIG:ReleaseClient>:_LUA_GAME>
  $<$<CONFIG:ReleaseClient>:_WIN32_WINNT=0x0500>
)

target_link_options(Game PUBLIC 
"$<$<C_COMPILER_ID:MSVC>:-SAFESEH:NO>"  
"/NODEFAULTLIB:libci.lib" 
"/DELAYLOAD:d3d8.dll,dinput8.dll"
"$<$<CONFIG:DebugClient>:/DEBUG:FULL>"
)

target_link_options(MindPower3D PUBLIC 
  "$<$<CONFIG:DebugClient>:/DEBUG:FULL>"
)

target_link_options(CaLua PUBLIC 
  "$<$<CONFIG:DebugClient>:/DEBUG:FULL>"
)

target_compile_definitions(MindPower3D PRIVATE
  $<$<CONFIG:DebugClient>:_WINDOWS>
  $<$<CONFIG:DebugClient>:WIN32>
  $<$<CONFIG:DebugClient>:_DEBUG>
  
  $<$<CONFIG:ReleaseClient>:WIN32>
  $<$<CONFIG:ReleaseClient>:_WINDOWS>
  $<$<CONFIG:ReleaseClient>:NDEBUG>

  # MindPower Specific Preprocessor directives, (gotta investigate what each one of them does)
  $<$<CONFIG:DebugClient>:USE_MINDPOWER>
  $<$<CONFIG:ReleaseClient>:USE_MINDPOWER>

  $<$<CONFIG:DebugClient>:MINDPOWER_USE_DLL>
  $<$<CONFIG:ReleaseClient>:MINDPOWER_USE_DLL>

  $<$<CONFIG:DebugClient>:MINDPOWER_EXPORTS>
  $<$<CONFIG:ReleaseClient>:MINDPOWER_EXPORTS>

  $<$<CONFIG:DebugClient>:LW_USE_DXMATH_LIB>
  $<$<CONFIG:ReleaseClient>:LW_USE_DXMATH_LIB>

  $<$<CONFIG:DebugClient>:_UNLOADRES>
  $<$<CONFIG:ReleaseClient>:_UNLOADRES>

  # $<$<CONFIG:DebugClient>:LW_USE_DX9>
  # $<$<CONFIG:ReleaseClient>:LW_USE_DX9>

  $<$<CONFIG:DebugClient>:LW_USE_DX8>
  $<$<CONFIG:ReleaseClient>:LW_USE_DX8>

  $<$<CONFIG:DebugClient>:USE_DX_VERSION>
  $<$<CONFIG:ReleaseClient>:USE_DX_VERSION>
)

target_compile_options(Game PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

target_compile_options(ICUHelper PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

target_compile_options(Common PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

target_compile_options(NetworkingSDK PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

target_compile_options(UtilLib PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

target_compile_options(CaLua PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)

target_compile_options(LuaLib PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

target_compile_options(Lua50 PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

target_compile_options(AudioSDL PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

target_compile_options(MindPower3D PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

target_compile_options(VisualMotionD3D PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

target_compile_options(StatusLib PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

target_compile_options(EncLib PRIVATE
"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   

set_property(TARGET ICUHelper PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)

set_property(TARGET UtilLib PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)

set_property(TARGET Common PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)

set_property(TARGET NetworkingSDK PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)

set_property(TARGET LuaLib PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)
set_property(TARGET Lua50 PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)

set_property(TARGET AudioSDL PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)

set_property(TARGET VisualMotionD3D PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)

set_property(TARGET MindPower3D PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)

set_property(TARGET CaLua PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>DLL"
)

set_property(TARGET StatusLib PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)

set_property(TARGET EncLib PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:DebugClient>:Debug>"
)

set (CLIENT_BIN_OUTPUT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/ToP-Revival-Client/system")
set_target_properties(Game PROPERTIES 
  VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/ToP-Revival-Client"
  VS_DEBUGGER_COMMAND_ARGUMENTS "startgame"
  VS_DEBUGGER_COMMAND "${CLIENT_BIN_OUTPUT_DIR}/Game.exe"
) 
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT Game)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  $<TARGET_FILE:Game>
  "${CLIENT_BIN_OUTPUT_DIR}/Game.exe"
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/zh_Hans_CN.res"
  ${CLIENT_BIN_OUTPUT_DIR}
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/Flash9f.ocx"
  ${CLIENT_BIN_OUTPUT_DIR}
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/PAI.dll"
  ${CLIENT_BIN_OUTPUT_DIR}
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/SDL.dll"
  ${CLIENT_BIN_OUTPUT_DIR}
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/SDL_mixer.dll"
  ${CLIENT_BIN_OUTPUT_DIR}
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/smpeg.dll"
  ${CLIENT_BIN_OUTPUT_DIR}
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/Game.loc"
  ${CLIENT_BIN_OUTPUT_DIR}
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/Configuration/chat.clu"
  ${CLIENT_BIN_OUTPUT_DIR}/../scripts/lua/forms/chat.clu
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/icu/bin/icuuc38.dll"
  ${CLIENT_BIN_OUTPUT_DIR}
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/icu/bin/icuin38.dll"
  ${CLIENT_BIN_OUTPUT_DIR}
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/icu/bin/icudt38.dll"
  ${CLIENT_BIN_OUTPUT_DIR}
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/CaLua/build/$<CONFIG>/CaLua.dll"
  ${CLIENT_BIN_OUTPUT_DIR}
)

add_custom_command(TARGET Game POST_BUILD        
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "${CMAKE_CURRENT_SOURCE_DIR}/../3DMindPowerEngine/build/$<CONFIG>/MindPower3D.dll"
  ${CLIENT_BIN_OUTPUT_DIR}
)

set(CMAKE_EXE_LINKER_FLAGS_DEBUGCLIENT "")
set(CMAKE_EXE_LINKER_FLAGS_RELEASECLIENT "")