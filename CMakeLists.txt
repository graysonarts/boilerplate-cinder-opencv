cmake_minimum_required(VERSION 2.8)
PROJECT (boilerplateCinderOpenCV)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
    "${CMAKE_SOURCE_DIR}/CMake/"
)

include("Version")
SetProjectVersion(1 0 0)

set(Cinder_ROOT_DIR $ENV{CINDER_ROOT})
set(CMAKE_MACOSX_RPATH 1)
set(RELEASE_PATH "body:Progress-${project_VERSION}")
include_directories(
    ${CMAKE_BINARY_DIR}/bin
    ${CMAKE_SOURCE_DIR}/include
)

find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})
message(STATUS "opencv = ${OpenCV_VERSION}")

find_package(Cinder REQUIRED)
message(STATUS "cinder = ${Cinder_FOUND}")

find_package(TBB REQUIRED)
include_directories(${TBB_INCLUDE_DIR})

add_definitions(-std=c++11)

LINK_DIRECTORIES(
    ${CMAKE_BINARY_DIR}/bin
    ${TBB_LIBRARY_DIRS}
)

add_subdirectory(code)
