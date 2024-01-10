@echo off

TITLE Tales of Pirates - CMake

set Generator="Visual Studio 17 2022"
set StartDir=%cd%
set CommonDependenciesDir=%StartDir%\CommonDependencies\
set MindPowerEngineDir=%StartDir%\3DMindPowerEngine\
set ClientDir=%StartDir%\Client\


:: - 
:: - Let's check if CMake is available or not?
:: - 
set cmake_found=0

echo Checking the availability of CMake

for /f "tokens=1,2,3" %%i in ('cmake --version') do (
    if "%%i %%j" == "cmake version" (
        set cmake_found=1
        set cmake_version=%%k
    )
)

if %cmake_found% == 1 (
    echo CMake version %cmake_version% found.
) else (
    echo CMake not found, please get it from "https://cmake.org/download/" first.
    goto end
)


:: - 
:: - Let's CMake - Common Dependencies :-)
:: - 
echo CMake-ing Common Dependencies ...

set CommonDependency=%CommonDependenciesDir%AudioSDL\;^
                %CommonDependenciesDir%CaLua\Lua;^
                %CommonDependenciesDir%CaLua\LuaLib;^
                %CommonDependenciesDir%CaLua\;^
                %CommonDependenciesDir%Common\;^
                %CommonDependenciesDir%EncLib\;^
                %CommonDependenciesDir%ICUHelper\;^
                %CommonDependenciesDir%InfoNet\;^
                %CommonDependenciesDir%Server\sdk\;^
                %CommonDependenciesDir%Status\;^
                %CommonDependenciesDir%Util\

for %%i in (%CommonDependency%) do (
    cd %%i
    echo     In:  %%i
    echo     Issuing: cmake.exe -G%Generator% -H. -B./build -AWin32
    cmake.exe -G%Generator% -H. -B./build -AWin32
)

:: - 
:: - Let's CMake - 3DMindPowerEngine :-)
:: - 
echo CMake-ing 3DMindPowerEngine ...

set MindPowerEngine=%MindPowerEngineDir%Dependencies\VisualMotionD3D\;^
                %MindPowerEngineDir%

for %%i in (%MindPowerEngine%) do (
    cd %%i
    echo     In:  %%i
    echo     Issuing: cmake.exe -G%Generator% -H. -B./build -AWin32
    cmake.exe -G%Generator% -H. -B./build -AWin32
)

:: - 
:: - Let's CMake - Client :-)
:: - 
echo CMake-ing Client ...

set Client=%ClientDir%

for %%i in (%Client%) do (
    cd %%i
    echo     In:  %%i
    echo     Issuing: cmake.exe -G%Generator% -H. -B./build -AWin32
    cmake.exe -G%Generator% -H. -B./build -AWin32
)











:: - 
:: - Done
:: - 
:end

cd %StartDir%
PAUSE

