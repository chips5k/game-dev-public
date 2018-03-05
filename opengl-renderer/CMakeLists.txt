cmake_minimum_required(VERSION 3.9)
project(opengl-renderer)

set(CMAKE_CXX_STANDARD 11)

find_package(glfw3 3.2 REQUIRED)
find_package(OpenGL REQUIRED)

# glad and stb_image are fetched locally by setup_dependencies.sh
add_library(glad vendor/glad.c)
add_library(stb vendor/stb_image.cpp)

add_executable(opengl-renderer main.cpp)

include_directories(vendor)
add_custom_command(TARGET opengl-renderer POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CMAKE_SOURCE_DIR}/resources ${CMAKE_BINARY_DIR}/resources)

target_link_libraries(opengl-renderer glfw glad stb OpenGL::GL ${CMAKE_DL_LIBS})
