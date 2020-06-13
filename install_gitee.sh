#!/usr/bin/sh

RealPath="/usr/bin/realpath"
GiteePath="https://gitee.com"
GitPath="/usr/bin/git"
VimPluggPath="`${RealPath} ~`/.vim/plugged"
ConfPath="./submodeuls_conf"

git_clone()
{
    ${GitPath} clone $1 $2
}

update_git()
{
    if [ "$1" == "True" ];then
        ${GitPath} submodule update --init --recursive
    else
        ${GitPath} submodule update --init
    fi
}

copy_file()
{
    \cp -abrf $1 $2
}

install_YouCompleteMe()
{
    ycp_name="YouCompleteMe"
    ycp_dirname="${ycp_name}"
    ycp_giteename="Icey9/YouCompleteMe.git"

    clone_path="${GiteePath}/${ycp_giteename}"
    ycp_path="${VimPluggPath}/${ycp_dirname}"
    #clone YouCompleteMe
    git_clone ${clone_path} ${ycp_path}

    conf_path="${ConfPath}/${ycp_name}_gitmodules"
    submodule_path="${ycp_path}/.gitmodules"
    # replace gitmodules
    copy_file ${conf_path} ${submodule_path}

    # uodate submodule
	pushd ${ycp_path}
        update_git
    popd

    ycmd_name="ycmd"
    ycmd_dirname="third_party/${ycmd_name}"
    ycmd_path="${ycp_path}/${ycmd_dirname}"
    conf_path="${ConfPath}/${ycmd_name}_gitmodules"
    submodule_path="${ycmd_path}/.gitmodules"
    # replace gitmodules
    copy_file ${conf_path} ${submodule_path}

	pushd ${ycmd_path}
	    # clone submodules
        update_git
	popd

    jedi_name="jedi"
    jedi_dirname="third_party/jedi_deps/${jedi_name}"
    jedi_path="${ycmd_path}/${jedi_dirname}"
    conf_path="${ConfPath}/${jedi_name}_gitmodules"
    submodule_path="${jedi_path}/.gitmodules"
    # replace gitmodules
    copy_file ${conf_path} ${submodule_path}

	pushd ${ycp_path}
	    # clone all submodules
        update_git "True"
        sudo yum install -y cmake gcc-c++ make python3-devel
	    ./install.py --all
    popd
}

main()
{
    set -x
    install_YouCompleteMe
}

main
