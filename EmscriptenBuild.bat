pushd %~dp0
mkdir BuildEm

pushd BuildEm
call %1\emsdk_env.bat || goto :error
call emcmake cmake -G "Unix Makefiles" -DEMSCRIPTEN=1 -DCMAKE_MAKE_PROGRAM=mingw32-make -DCMAKE_BUILD_TYPE=%2 .. || goto :error
call emmake mingw32-make || goto :error
popd
echo Build Succeeded.

popd
exit /b 0

:error
echo Build Failed with Error %errorlevel%.
popd
popd
exit /b 1
