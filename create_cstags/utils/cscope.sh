#!/bin/bash
set -x
CurrentPath=$(pwd | sed 's$\/$_$g')
CscopePath="$HOME/.vim/cscope_tags/${CurrentPath}"
LocalPath=$(pwd)
mkdir -p ${CscopePath}

except_path="-type f ! -path \"*/qa/*\""
find ${LocalPath} -name "*.h" ${except_path} -o -name "*.hpp" ${except_path} \
        -o -name "*.c" ${except_path} -o -name "*.cc" ${except_path} \
        -o -name "*.cpp" ${except_path} -o -name "*.py" ${except_path} \
        -o -name "*.sh" ${except_path} \
        > ${CscopePath}/cscope.files
#    | grep -v "/qa/"| sed "s/^\./$currentPath/" > cscope.files
cscope -bkq -f${CscopePath}/cscope -i${CscopePath}/cscope.files
ctags -R -f ${CscopePath}/tags ${LocalPath}
