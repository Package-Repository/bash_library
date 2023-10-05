#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "string_manipulations.sh"
snake_case_name=$1
upper_case_name=$(snake_to_uppercase "$snake_case_name")
camel_case_name=$(snake_to_camel "$snake_case_name")

mkdir $1
cd $1


HEADER_CONTENT=$(cat << EOL
#ifndef ${upper_case_name}_H
#define ${upper_case_name}_H

#define NUMERIC_ZERO 0

int ${camel_case_name}(int arg);

#endif

EOL
)

SOURCE_CONTENT=$(cat << EOL
#include "$snake_case_name.h"

int ${camel_case_name}(int arg)
{
    return arg + NUMERIC_ZERO;
}

EOL
)

MAIN_CONTENT=$(cat << EOL
#include "$snake_case_name.h"

int main(int argc, char * argv[])
{
    return ${camel_case_name}(NUMERIC_ZERO);
}
EOL
)

CMAKE_CONTENT=$(cat << EOL
cmake_minimum_required(VERSION 3.5)
project($snake_case_name)

get_filename_component(SRC_DIR "\${CMAKE_CURRENT_SOURCE_DIR}" DIRECTORY)

# find_library(LIBRARY library)

file(GLOB SOURCES src/*.cpp)
include_directories(include)

add_library(
    \${PROJECT_NAME}
    SHARED 
    \${SOURCES}
)

add_executable(
    \${PROJECT_NAME}_exec
    main/main.cpp
)

target_link_libraries(
    \${PROJECT_NAME} PRIVATE 
    # \${LIBRARY}
)

target_link_libraries(
    \${PROJECT_NAME}_exec PRIVATE 
    \${PROJECT_NAME}
)

install(
    TARGETS \${PROJECT_NAME} 
    DESTINATION lib/\${PROJECT_NAME}
)

file(GLOB HEADERS include/*.h)
install(FILES \${HEADERS} DESTINATION include/\${PROJECT_NAME})

install(
    TARGETS \${PROJECT_NAME}_exec 
    DESTINATION bin/\${PROJECT_NAME}
)

EOL
)

mkdir include
mkdir src
mkdir main

echo "$SOURCE_CONTENT" >  "src/$snake_case_name.cpp"
echo "$HEADER_CONTENT" >  "include/$snake_case_name.h"
echo "$MAIN_CONTENT" >    "main/main.cpp"
echo "$CMAKE_CONTENT" >   "CMakeLists.txt"

mkdir build && cd build && cmake .. && make