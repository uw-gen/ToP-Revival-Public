@echo off

TITLE Tales of Pirates - Build

set cwd=%cd%


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
:: - Let's build :-)
:: - 
echo Building with CMake ...











:: - 
:: - Done
:: - 
:end

PAUSE

