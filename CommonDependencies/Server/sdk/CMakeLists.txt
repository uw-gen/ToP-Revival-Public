cmake_minimum_required(VERSION 3.26.4)

project(NetworkingSDK)

set(SOURCE_FILES_DIR ${CMAKE_CURRENT_SOURCE_DIR}"../src")
set(SOURCE_FILES 
${SOURCE_FILES_DIR}/AcceptConnect.cpp
${SOURCE_FILES_DIR}/Comm.cpp
${SOURCE_FILES_DIR}/CommRPC.cpp
${SOURCE_FILES_DIR}/DataSocket.cpp
${SOURCE_FILES_DIR}/DBCCommon.cpp
${SOURCE_FILES_DIR}/IniFile.cpp
${SOURCE_FILES_DIR}/LogStream.cpp
${SOURCE_FILES_DIR}/NTSvcObject.cpp
${SOURCE_FILES_DIR}/Packet.cpp
${SOURCE_FILES_DIR}/PacketQueue.cpp
${SOURCE_FILES_DIR}/Point.cpp
${SOURCE_FILES_DIR}/Receiver.cpp
${SOURCE_FILES_DIR}/RWMutex.cpp
${SOURCE_FILES_DIR}/Sender.cpp
${SOURCE_FILES_DIR}/TaskQueue.cpp
${SOURCE_FILES_DIR}/ThreadPool.cpp
${SOURCE_FILES_DIR}/Timer.cpp
)

add_library(NetworkingSDK STATIC ${SOURCE_FILES})

target_compile_features(NetworkingSDK PRIVATE cxx_std_17)

# Configuration types
IF(BUILD_TYPE STREQUAL "CLIENT")
  SET(CMAKE_CONFIGURATION_TYPES "DebugServer;ReleaseServer;DebugClient;ReleaseClient" CACHE STRING "Configs" FORCE)
ELSE()
  SET(CMAKE_CONFIGURATION_TYPES "DebugServer;ReleaseServer" CACHE STRING "Configs" FORCE)
ENDIF()
IF(DEFINED CMAKE_BUILD_TYPE AND CMAKE_VERSION VERSION_GREATER "2.8")
  SET_PROPERTY(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS ${CMAKE_CONFIGURATION_TYPES})
ENDIF()

set_property(TARGET NetworkingSDK PROPERTY
  MSVC_RUNTIME_LIBRARY 
  "MultiThreaded$<$<OR:$<CONFIG:DebugServer>,$<CONFIG:DebugClient>>:Debug>"
)

target_compile_definitions(NetworkingSDK PRIVATE
  $<$<CONFIG:DebugServer>:_SERVER>
  $<$<CONFIG:ReleaseServer>:_SERVER>
  
  $<$<CONFIG:DebugClient>:_NOSERVER>
  $<$<CONFIG:ReleaseClient>:_NOSERVER>
  
  $<$<CONFIG:DebugClient>:_DEBUG>
  $<$<CONFIG:DebugServer>:_DEBUG>
)

target_compile_options(NetworkingSDK PRIVATE
"$<$<CONFIG:DebugServer>:/Zi>"
"$<$<CONFIG:DebugServer>:/Ob0>"
"$<$<CONFIG:DebugServer>:/Od>"
"$<$<CONFIG:DebugServer>:/RTC1>"

"$<$<CONFIG:DebugClient>:/Zi>"
"$<$<CONFIG:DebugClient>:/Ob0>"
"$<$<CONFIG:DebugClient>:/Od>"
"$<$<CONFIG:DebugClient>:/RTC1>"
)   


set(DEPENDENCY_DIRECTORY "./include")
target_include_directories(NetworkingSDK PRIVATE ${DEPENDENCY_DIRECTORY})