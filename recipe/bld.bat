@echo ON
setlocal enabledelayedexpansion


:: CMake/OpenCV like Unix-style paths for some reason.    
set UNIX_PREFIX=%PREFIX:\=/%
set UNIX_LIBRARY_PREFIX=%LIBRARY_PREFIX:\=/%       
set UNIX_LIBRARY_BIN=%LIBRARY_BIN:\=/%
set UNIX_LIBRARY_INC=%LIBRARY_INC:\=/%
set UNIX_LIBRARY_LIB=%LIBRARY_LIB:\=/%
set UNIX_SP_DIR=%SP_DIR:\=/%
set UNIX_SRC_DIR=%SRC_DIR:\=/%


mkdir build1 && pushd build1
:: Test with Ninja
cmake -LAH -G "Ninja"                                                               ^
    -DCMAKE_BUILD_TYPE="Release"                                                    ^
    -DCMAKE_PREFIX_PATH=%UNIX_LIBRARY_PREFIX%                                       ^
    -DCMAKE_INSTALL_PREFIX=%UNIX_LIBRARY_PREFIX%                                    ^
    ..
if errorlevel 1 exit 1

cmake --build . --target install --config Release

if errorlevel 1 exit 1

