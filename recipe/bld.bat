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

:: Display available generators
cmake -G

mkdir build1 && pushd build1
:: Test with Ninja
cmake -LAH -G "Ninja"                                                               ^
    -DCMAKE_BUILD_TYPE="Release"                                                    ^
    -DCMAKE_PREFIX_PATH=%UNIX_LIBRARY_PREFIX%                                       ^
    -DCMAKE_INSTALL_PREFIX=%UNIX_LIBRARY_PREFIX%                                    ^
    -DOpenCV_DIR=%UNIX_PREFIX%/x64/vc14/lib                                                  ^
    -DOPENCV_FOUND=ON                                                               ^
    ..
cmake --build . --target install --config Release

popd

mkdir build2 && pushd build2
cmake -LAH -G "NMake Makefiles"                                                     ^
    -DCMAKE_BUILD_TYPE="Release"                                                    ^
    -DCMAKE_PREFIX_PATH=%UNIX_LIBRARY_PREFIX%                                       ^
    -DCMAKE_INSTALL_PREFIX=%UNIX_LIBRARY_PREFIX%                                    ^
    -DOpenCV_DIR=%UNIX_PREFIX%/x64/vc14/lib                                               ^
    -DOPENCV_FOUND=ON                                                               ^
    ..
nmake

popd


:: Test basic configuration
mkdir build3 && pushd build3
cmake -LH -A "x64"                                                                  ^      
    -DCMAKE_BUILD_TYPE="Release"                                                    ^
    -DCMAKE_PREFIX_PATH=%UNIX_LIBRARY_PREFIX%                                       ^
    -DCMAKE_INSTALL_PREFIX=%UNIX_LIBRARY_PREFIX%                                    ^
    -DOpenCV_DIR=%UNIX_PREFIX%/x64/vc14/lib                                                ^
    -DOpenCV_FOUND=ON                                                               ^
    ..
cmake --build . --target install --config Release

popd


:: Test basic configuration
mkdir build4 && pushd build4
cmake -LAH -G "Visual Studio 14 2015 Win64"                                                                  ^      
    -DCMAKE_BUILD_TYPE="Release"                                                    ^
    -DCMAKE_PREFIX_PATH=%UNIX_LIBRARY_PREFIX%                                       ^
    -DCMAKE_INSTALL_PREFIX=%UNIX_LIBRARY_PREFIX%                                    ^
    -DOpenCV_DIR=%UNIX_PREFIX%/x64/vc14/lib                                           ^
    -DOpenCV_FOUND=ON                                                               ^
    ..
cmake --build . --target install --config Release

popd

:: Test basic configuration
mkdir build5 && pushd build5
cmake -LAH -G "Visual Studio 14 2015 Win64"                                                                  ^      
    -DCMAKE_BUILD_TYPE="Release"                                                    ^
    -DCMAKE_PREFIX_PATH=%UNIX_LIBRARY_PREFIX%                                       ^
    -DCMAKE_INSTALL_PREFIX=%UNIX_LIBRARY_PREFIX%                                    ^
    -DOpenCV_DIR=%UNIX_PREFIX%/x64/vc14/lib                                         ^
    -DOpenCV_FOUND=ON                                                               ^
    ..
cmake --build . --target install --config Release

popd

:: Test basic configuration
mkdir build6 && pushd build6
cmake -LAH -G "Visual Studio 15 2017 Win64"                                                                  ^      
    -DCMAKE_BUILD_TYPE="Release"                                                    ^
    -DCMAKE_PREFIX_PATH=%UNIX_LIBRARY_PREFIX%                                       ^
    -DCMAKE_INSTALL_PREFIX=%UNIX_LIBRARY_PREFIX%                                    ^
    -DOpenCV_DIR=%UNIX_PREFIX%/x64/vc14/lib                                         ^
    -DOpenCV_FOUND=ON                                                               ^
    ..
cmake --build . --target install --config Release



if errorlevel 1 exit 1
if errorlevel 1 exit 1

