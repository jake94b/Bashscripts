#!/bin/bash
##Script for Node.js installation

SOURCE="https://nodejs.org/dist/node-latest.tar.gz"
SOURCEPATH="usr/local/src"

begin(){

}

pass{

}

end{

}

find_os{
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
   OS=SuSE
   VER=$(cat /etc/SuSE-release)
elif [ -f /etc/redhat-release ]; then
   OS=Redhat
   VER=$(cat /etc/redhat-release)
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi
}
install_src(){

}

install_deps(){
    if[[ $OS ==  "Redhat" ]]; then
        local INSTALL="usr/bin/yum -qy install"
        local DEPS="gcc-c++ make git opensll-devel"
    elif[[ $OS == "Ubuntu" ]]; then
        local INSTALL="usr/bin/apt-get install -yq"
        local DEPS="build-essential git-core libssl-dev"
    elif[[ $OS == "SuSE" }}; then
        local INSTALL="usr/bin/"
        local DEPS=""
    elif[[ $OS == "Debian" ]]; then
        local INSTALL=""
        local DEPS=""
    fi


}

find_os
install_deps
install_src ${SOURCE}



echo "Node.JS $(Node -v) has been successfully installed in $(echo ${SOURCEPATH})"
