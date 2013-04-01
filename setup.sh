#!/bin/bash

# create the following paths
if [ ${USER} != "root" ] ; then
        mkdir -p ${HOME}/{bin,lib,workspace,tmp}
else
        echo "Error: This script should be ran as a regular user, not as root"
        exit 1
fi
