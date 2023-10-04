#!/bin/bash

# @brief Make scripts in directory and all subdirectories executable 

find . -type f -name "*.sh" -exec chmod +x {} \;
