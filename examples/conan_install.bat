REM Install luapbintf/0.1@jinq0123/testing

REM CHANGE conandata!
set conandata=C:\Users\jinqing\.conan\data

REM Ignore if ERROR: Remote 'jinq0123' already exists with same URL
conan remote add remote_bintray_jinq0123 https://api.bintray.com/conan/jinq0123/test

REM Using debug_x64
arg=--build missing -s build_type=Debug -s arch=x86_64 -s compiler.runtime=MDd

conan install luapbintf/0.1@jinq0123/testing %arg%
conan install grpc-lua/0.1@jinq0123/testing %arg%

REM Ignore if ERROR: Remote 'remote_bintray_jinq0123' not found in remotes
conan remote remove remote_bintray_jinq0123

REM Copy exe and dlls.
set lua_cpp_exe=%conandata%\lua-cpp\5.3.4\jinq0123\testing\package\c83d8b197f1a331ca3b55943846d427ad4f7f8e1\bin\lua-cpp.exe
copy "%lua_cpp_exe%" helloworld\
copy "%lua_cpp_exe%" route_guide\
set luapbintf_dll=%conandata%\luapbintf\0.1\jinq0123\testing\package\33364f43a1ad585f1513b55ab7b5a8ab2b38e187\bin\luapbintf.dll
set grpc_lua_dll=%conandata%\grpc-lua\0.1\jinq0123\testing\package\c83d8b197f1a331ca3b55943846d427ad4f7f8e1\bin\grpc-lua.dll
REM or set grpc_lua_dll=..\..\premake\vs2015\bin\x64\Debug\grpc-lua.dll
copy "%luapbintf_dll%" helloworld\
copy "%luapbintf_dll%" route_guide\
copy "%grpc_lua_dll%" helloworld\
copy "%grpc_lua_dll%" route_guide\

