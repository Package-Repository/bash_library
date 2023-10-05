SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "string_manipulations.sh"
snake_case_name=$1
upper_case_name=$(snake_to_uppercase "$snake_case_name")
camel_case_name=$(snake_to_camel "$snake_case_name")

SRC_CONTENT=$(cat << EOL
/* 
 * @brief $1 does something cool
 *
 * more
 * more
 * more
 */

#include "$snake_case_name.h"

// Does something
int ${camel_case_name}(int arg)
{
    return arg + NUMERIC_ZERO;
}
EOL
)

HEADER_CONTENT=$(cat << EOL
#ifndef ${upper_case_name}_H
#define ${upper_case_name}_H

#define NUMERIC_ZERO 0

int ${camel_case_name}(int arg);

#endif
EOL
)

echo "$SRC_CONTENT" > "src/$1.cpp"
echo "$HEADER_CONTENT" > "include/$1.h" 
