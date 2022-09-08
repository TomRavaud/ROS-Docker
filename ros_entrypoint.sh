#!/bin/bash
set -e

#  setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"

# setup workspace if it exists
if test -n "$WORKSPACE_NAME"
then
    if test ! -e "/root/$WORKSPACE_NAME/devel/setup.sh"
    then
        previousDirectory=$PWD
        cd /root/$WORKSPACE_NAME
        catkin_make
        cd $previousDirectory
    fi
    source "/root/$WORKSPACE_NAME/devel/setup.sh"
fi

exec "$@"
