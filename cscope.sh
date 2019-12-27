#!/bin/bash
currentPath=$(pwd | sed 's$\/$\\\/$g')
echo $currentPath
except_path="-type f ! -path \"*/qa/*\""
find . -name "*.h" -type f -o -name "*.hpp" -type f -o -name "*.c" -type f -o -name "*.cc" -type f -o -name "*.cpp" -type f -o -name "*.py" -type f -o -name "*.sh" -type f\
    | grep -v "/qa/"| sed "s/^\./$currentPath/" > cscope.files
cscope -bkq -i cscope.files
ctags -R ./
