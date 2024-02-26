cmake_minimum_required(VERSION 3.27)
project(AbyssApplication CXX)

set(CXX_STANDARD 20)
set(CMAKE_C_COMPILER gcc)
set(CMAKE_CXX_COMPILER g++)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/build/cmake")

include(build/cmake/get-source-files.cmake)

find_package(AbyssEngine CONFIG REQUIRED)
find_package(raylib REQUIRED)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

target_link_libraries(${PROJECT_NAME} PRIVATE abyssengine::abyssengine raylib)



