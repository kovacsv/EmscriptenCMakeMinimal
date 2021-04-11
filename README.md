# Emscripten CMake Minimal

A minimalist example to build an [Emscripten](https://emscripten.org) application with CMake.

[![Build status](https://ci.appveyor.com/api/projects/status/nwgrvu5xdvp3eej4?svg=true)](https://ci.appveyor.com/project/kovacsv/emscriptencmakeminimal)

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
emsdk install latest
emsdk activate latest
emsdk install mingw-4.6.2-32bit
emsdk activate mingw-4.6.2-32bit
```

### 3. Generate the Visual Studio Project (Optional)

You can create the project with CMake, and build it with Visual Studio. This step is optional. The Visual Studio project is useful if you would like to debug the functionalities, but it is not necessary for building the web application.

```
mkdir Build
cd Build
cmake -G "Visual Studio 16 2019" -A "Win32" ..
cd ..
```

### 4. Generate the Web Application

The easiest way is to run the `EmscriptenBuild.bat` file from the root directory. It needs two command line parameters:
- The Emscripten SDK folder (e.g. "C:\Emscripten\emsdk").
- The build configuration type (Debug or Release).

```
EmscriptenBuild.bat C:\Emscripten\emsdk Release
```

### 5. Open it in a Web Browser

- Start a web server in the root directory.
  - With Python 3: `python -m http.server 8000`.
  - On Windows just run the `StartServerWin.bat` script.
- Open your browser, and navigate to: `http://localhost:8000/BuildEm/WebSite.html`
