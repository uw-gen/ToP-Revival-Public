cmake_minimum_required(VERSION 3.26.4)

project(MindPower3D)

set(SOURCE_FILES_DIR "../Engine/src")
set(SOURCE_FILES
  ${SOURCE_FILES_DIR}/Blk.cpp
  ${SOURCE_FILES_DIR}/d3dfont.cpp
  ${SOURCE_FILES_DIR}/d3dutil.cpp
  ${SOURCE_FILES_DIR}/dxutil.cpp
  ${SOURCE_FILES_DIR}/EffectFile.cpp
  ${SOURCE_FILES_DIR}/I_Effect.cpp
  ${SOURCE_FILES_DIR}/lwAnimCtrl.cpp
  ${SOURCE_FILES_DIR}/lwAnimCtrlObj.cpp
  ${SOURCE_FILES_DIR}/lwAnimKeySetPRS.cpp
  ${SOURCE_FILES_DIR}/lwBitmap.cpp
  ${SOURCE_FILES_DIR}/lwCamera.cpp
  ${SOURCE_FILES_DIR}/lwConsole.cpp
  ${SOURCE_FILES_DIR}/lwCoordinateSys.cpp
  ${SOURCE_FILES_DIR}/lwD3DSettings.cpp
  ${SOURCE_FILES_DIR}/lwDDSFile.cpp
  ${SOURCE_FILES_DIR}/lwDeviceObject.cpp
  ${SOURCE_FILES_DIR}/lwDirectoryBrowser.cpp
  ${SOURCE_FILES_DIR}/lwEfxTrack.cpp
  ${SOURCE_FILES_DIR}/lwExpObj.cpp
  ${SOURCE_FILES_DIR}/lwFile.cpp
  ${SOURCE_FILES_DIR}/lwFileEncode.cpp
  ${SOURCE_FILES_DIR}/lwFileStream.cpp
  ${SOURCE_FILES_DIR}/lwFileutil.cpp
  ${SOURCE_FILES_DIR}/lwgraphicsutil.cpp
  ${SOURCE_FILES_DIR}/lwGuidObj.cpp
  ${SOURCE_FILES_DIR}/lwHeap.cpp
  ${SOURCE_FILES_DIR}/lwHelperGeometry.cpp
  ${SOURCE_FILES_DIR}/lwIFunc.cpp
  ${SOURCE_FILES_DIR}/lwInterface.cpp
  ${SOURCE_FILES_DIR}/lwItem.cpp
  ${SOURCE_FILES_DIR}/lwIUtil.cpp
  ${SOURCE_FILES_DIR}/lwmath.cpp
  ${SOURCE_FILES_DIR}/lwMisc.cpp
  ${SOURCE_FILES_DIR}/lwModel.cpp
  # ${SOURCE_FILES_DIR}/lwModelObject.cpp
  ${SOURCE_FILES_DIR}/lwNodeObject.cpp
  ${SOURCE_FILES_DIR}/lwObjectMethod.cpp
  ${SOURCE_FILES_DIR}/lwObjectPool.cpp
  ${SOURCE_FILES_DIR}/lwPathInfo.cpp
  ${SOURCE_FILES_DIR}/lwPhysique.cpp
  ${SOURCE_FILES_DIR}/lwPoseCtrl.cpp
  ${SOURCE_FILES_DIR}/lwPrimitive.cpp
  ${SOURCE_FILES_DIR}/lwPrimitiveHelper.cpp
  ${SOURCE_FILES_DIR}/lwRenderCtrlEmb.cpp
  ${SOURCE_FILES_DIR}/lwRenderImp.cpp
  ${SOURCE_FILES_DIR}/lwResourceMgr.cpp
  ${SOURCE_FILES_DIR}/lwSceneMgr.cpp
  ${SOURCE_FILES_DIR}/lwShaderDeclMgr.cpp
  ${SOURCE_FILES_DIR}/lwShaderMgr.cpp
  ${SOURCE_FILES_DIR}/lwStreamObj.cpp
  ${SOURCE_FILES_DIR}/lwSysCharacter.cpp
  ${SOURCE_FILES_DIR}/lwSysGraphics.cpp
  ${SOURCE_FILES_DIR}/lwSystem.cpp
  ${SOURCE_FILES_DIR}/lwSystemInfo.cpp
  ${SOURCE_FILES_DIR}/lwThreadPool.cpp
  ${SOURCE_FILES_DIR}/lwTimer.cpp
  ${SOURCE_FILES_DIR}/lwTreeNode.cpp
  ${SOURCE_FILES_DIR}/lwViewFrustum.cpp
  ${SOURCE_FILES_DIR}/lwxRenderCtrVS.cpp
  ${SOURCE_FILES_DIR}/MPCamera.cpp
  ${SOURCE_FILES_DIR}/MPCharacter.cpp
  ${SOURCE_FILES_DIR}/MPColorValue.cpp
  ${SOURCE_FILES_DIR}/MPConsole.cpp
  ${SOURCE_FILES_DIR}/MPDataStream.cpp
  ${SOURCE_FILES_DIR}/MPEffectCtrl.cpp
  ${SOURCE_FILES_DIR}/MPEffectMath.cpp
  ${SOURCE_FILES_DIR}/MPEffQuaternion.cpp
  ${SOURCE_FILES_DIR}/MPEffVector3.cpp
  ${SOURCE_FILES_DIR}/MPFont.cpp
  ${SOURCE_FILES_DIR}/MPGameApp.cpp
  # ${SOURCE_FILES_DIR}/MPGUI.cpp
  # ${SOURCE_FILES_DIR}/MPGUI_Render.cpp
  ${SOURCE_FILES_DIR}/MPMap.cpp
  ${SOURCE_FILES_DIR}/MPMapData.cpp
  ${SOURCE_FILES_DIR}/MPMath.cpp
  ${SOURCE_FILES_DIR}/MPModelEff.cpp
  ${SOURCE_FILES_DIR}/MPParticleCtrl.cpp
  ${SOURCE_FILES_DIR}/MPParticleSys.cpp
  ${SOURCE_FILES_DIR}/MPRender.cpp
  ${SOURCE_FILES_DIR}/MPResManger.cpp
  ${SOURCE_FILES_DIR}/MPSceneItem.cpp
  ${SOURCE_FILES_DIR}/MPSceneObject.cpp
  ${SOURCE_FILES_DIR}/MPShadeMap.cpp
  ${SOURCE_FILES_DIR}/MPStringUtil.cpp
  ${SOURCE_FILES_DIR}/MPTile.cpp
  ${SOURCE_FILES_DIR}/mygraph.cpp
  ${SOURCE_FILES_DIR}/ShaderLoad.cpp
  ${SOURCE_FILES_DIR}/Singleton.cpp
  ${SOURCE_FILES_DIR}/stdafx.cpp
  ${SOURCE_FILES_DIR}/TgaCore.cpp
  ${SOURCE_FILES_DIR}/ViM_helper.cpp
  ${SOURCE_FILES_DIR}/ZRBlock.cpp
)

add_library(MindPower3D SHARED ${SOURCE_FILES})

target_compile_features(MindPower3D PRIVATE cxx_std_17)

set(DEPENDENCY_DIRS 
  "./Engine/include"
  "Dependencies/DirectX8/include"
  "Dependencies/VisualMotionD3D/include"
  "../CommonDependencies/Util/include"
  "../CommonDependencies/Common/include"
  "../CommonDependencies/ICUHelper/inc"
  "../CommonDependencies/icu/include"
)
target_include_directories(MindPower3D PRIVATE ${DEPENDENCY_DIRS})

target_link_directories(MindPower3D PRIVATE "Dependencies/DirectX8/lib")

set_property(TARGET MindPower3D PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:Debug>:Debug>"
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/Dependencies/VisualMotionD3D/
  ${CMAKE_CURRENT_SOURCE_DIR}../Dependencies/VisualMotionD3D/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/Util/
  ${CMAKE_CURRENT_SOURCE_DIR}../../CommonDependencies/Util/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/Common
  ${CMAKE_CURRENT_SOURCE_DIR}../../CommonDependencies/Common/build/
)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/ICUHelper/
  ${CMAKE_CURRENT_SOURCE_DIR}../../CommonDependencies/ICUHelper/build/
)

target_link_libraries(MindPower3D PRIVATE
  VisualMotionD3D
  UtilLib
  Common
  ICUHelper 
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/icu/lib/icudt.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/icu/lib/icuuc.lib
  ${CMAKE_CURRENT_SOURCE_DIR}/../CommonDependencies/icu/lib/icuin.lib
  legacy_stdio_definitions.lib
)

target_link_options(MindPower3D PUBLIC "$<$<C_COMPILER_ID:MSVC>:-SAFESEH:NO>"  "/NODEFAULTLIB:libci.lib")

set_property(TARGET VisualMotionD3D PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<CONFIG:Debug>:Debug>"
)

target_compile_definitions(MindPower3D PRIVATE
  $<$<CONFIG:Debug>:_WINDOWS>
  $<$<CONFIG:Debug>:WIN32>
  $<$<CONFIG:Debug>:_DEBUG>
  
  $<$<CONFIG:Release>:WIN32>
  $<$<CONFIG:Release>:_WINDOWS>
  $<$<CONFIG:Release>:NDEBUG>

  # MindPower Specific Preprocessor directives, (gotta investigate what each one of them does)
  $<$<CONFIG:Debug>:USE_MINDPOWER>
  $<$<CONFIG:Release>:USE_MINDPOWER>

  $<$<CONFIG:Debug>:MINDPOWER_USE_DLL>
  $<$<CONFIG:Release>:MINDPOWER_USE_DLL>

  $<$<CONFIG:Debug>:MINDPOWER_EXPORTS>
  $<$<CONFIG:Release>:MINDPOWER_EXPORTS>

  $<$<CONFIG:Debug>:LW_USE_DXMATH_LIB>
  $<$<CONFIG:Release>:LW_USE_DXMATH_LIB>

  $<$<CONFIG:Debug>:_UNLOADRES>
  $<$<CONFIG:Release>:_UNLOADRES>

  # $<$<CONFIG:Debug>:LW_USE_DX9>
  # $<$<CONFIG:Release>:LW_USE_DX9>

  $<$<CONFIG:Debug>:LW_USE_DX8>
  $<$<CONFIG:Release>:LW_USE_DX8>

  $<$<CONFIG:Debug>:USE_DX_VERSION>
  $<$<CONFIG:Release>:USE_DX_VERSION>
)

target_link_options(MindPower3D PUBLIC
  "$<$<CONFIG:Debug>:/DEBUG:FULL>"
)  

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT MindPower3D)