# Emscripten CMake Minimal

[![Build status](https://ci.appveyor.com/api/projects/status/nwgrvu5xdvp3eej4?svg=true)](https://ci.appveyor.com/project/kovacsv/emscriptencmakeminimal)

A minimalist example to build an [Emscripten](https://emscripten.org) application with CMake.

## Building on Windows

### 1. Install Prerequisites

You have to install the following software:
- [CMake](https://cmake.org) (3.6 minimum version is needed).

### 2. Install Emscripten SDK

You can find detailed instruction on [Emscripten Download and install](https://emscripten.org/docs/getting_started/downloads.html) page. You have to use the following commands to set up the environment for VisualScriptEngineWeb:

```
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
git pull
git checkout tags/2.0.5
emsdk install 2.0.5
emsdk activate 2.0.5
emsdk install mingw-4.6.2-32bit
emsdk activate mingw-4.6.2-32bit
```

### 3. Generate the Visual Studio Project (Optional)

You can create the project with CMake, and build it with Visual Studio. This step is optional. The Visual Studio project is useful if you would like to debug the functionalities, but it is not necessary for building the web application.

```
mkdir Build
cd Build
cmake -G "Visual Studio 15 2017 Win64" ..
cd ..
```

### 4. Generate the Web Application

The easiest way is to run the `EmscriptenBuild.bat` file from the root directory. It needs three command line parameters:
- The Emscripten SDK folder (e.g. "C:\Emscripten\emsdk").
- The result folder of the web application (e.g. "C:\xampp\htdocs\WebApp").
- The build configuration type (Debug or Release).

```
EmscriptenBuild.bat C:\Emscripten\emsdk C:\xampp\htdocs\WebApp Release
```

### 5. Open it in a Web Browser

- Set up a web server for the result folder.
- Open it in a web browser.
