# Tales of Pirates - Revival

Welcome to ToP - Revival repo, What's this you may ask?
this is just a *Tales of Pirates* repo, specifically a *TOP II* source repo, This is initially identical to **娴风洍鐜婼erver.rar** from pkodev's released source code, all credits go to the rightful owners.

# Building The Source
This repo is using cmake, you'll need to get at least cmake version 3.26; it is recommended to just grab the latest version from [CMake Official Website](https://cmake.org/download/).

for common dependencies, you can use cmake with **VS Code** as your IDE and let CMake build it for you with **Visual Studio Developer CMD**, however when you get more specific and compile **Server Binaries** you'll need Visual Studio for the following reasons:
1. These projects are meant to have multi "Custom" configurations (for example, you'll need different builds for the NetworkingSDK library (aka ServerSDK) for Client & Server), so they are meant to be used with a multi-config generator, hence VS recommendation.
2. **VS Code** is NOT a multi-config generator, so it won't recognize your custom build configurations.

Enough of that, let's actually build the source, you can either use CMake GUI or CLI, it's all up to you; I'll only walk you through CLI.

## Building with CMake's CLI
Assuming you've installed latest version of [CMake](https://cmake.org/download/), you can verify your installation by typing:
```sh 
cmake --version
```

it should output something like `cmake version 3.26.4`, if it did then cool, else check your environment variables and make sure cmake's binaries are exposed.

now while you are using the same CMD navigate to `CommonDependencies/AudioSDL`, once you are there type 
```sh
cmake --help
```
scroll up to *Generators*, pick up your favored version of VS, Here I'll use VS 2022 (infact it is marked with an * (asterisk), as the default generator), now type:
```sh
cmake -G"<GENERATOR>" -H<SOURCE_DIR> -B<BUILD_DIR> -A<Platform_Architecture>
```
in my case I'll use this:
```sh
cmake.exe -G"Visual Studio 17 2022" -H. -B./build -AWin32
```

Notice how I replaced `<GENERATOR>` with my Generator in double quotes, `<SOURCE_DIR>` with a (dot) `.` (and no spaces), since we're on the same directory as CMakeLists.txt we can refer to the `<SOURCE_DIR>` as `.`, and for `<BUILD_DIR>` I recommend that you use `/build` directory consistently, since some projects here depend on that folder. (`<Platform_Architecture>` should always be `Win32`, since binaries only support 32 bit architecture)

or even shorter
```sh
cmake.exe -H. -B./build -AWin32 # Using the generator that's marked with * (asterisk), the default.
```

After that you'll find your .sln (VS project) in `/build` directory, go ahead and compile the project with **VS** we're done here!
Repeat the process with any project you wanna build from this repo.

# Currently ported projects

*Common Projects*
| Project | Ported? | CPP Version |
|---------|:---------:|---------|
| Common Dependencies  | :white_check_mark: | 17 

*Server Projects*
| Project | Ported? | CPP Version
|---------|:---------:|---------|
| AccountServer | :white_check_mark: | 17 
| GameServer  | :white_check_mark: | 17 
| GroupServer | :white_check_mark: | 17 
| GateServer  | :white_check_mark: | 17 
| InfoServer  | :x: | N/A 
| TradeSystem | :x: | N/A 

*Client Projects*
| Project | Ported? | CPP Version |
|---------|:---------:|---------|
| 3DMindPowerEngine  | :white_check_mark: | 17
| VisualMotionD3D | :white_check_mark: | 17
| Client | :white_check_mark: | 14
| ErrorReport | :x: | N/A 
| UpdateSysPKO | :x: | N/A 
| KopUpdate | :x: | N/A 
| VersionBuilder | :x: | N/A 

*Plug-ins & Tools Projects*
| Project | Ported? | CPP Version |
|---------|:---------:|---------|
| ExpCharacter  | :x: | N/A 
| ExpItem | :x: | N/A 
| ExpModelObject | :x: | N/A 
| ExpShapeTrack | :x: | N/A 
| ExpUtil | :x: | N/A 
| EffectEditor2 | :x: | N/A 