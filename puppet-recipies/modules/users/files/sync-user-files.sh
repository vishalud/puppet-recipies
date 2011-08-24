#!/bin/sh
#
# Sync users' files to their $HOMEs
# Based on http://semicomplete.googlecode.com/svn/sysadvent/2008/day11/synchome.sh
#
# Usage: Run as root. Put it in a crontab if required.
#
# * Wed Apr 28 Naresh V. <naresh.ve@directi.com> - 0.1-1
# - Initial release
#
# * Tue May 03 Naresh V. <naresh.ve@directi.com> - 0.1-2
# - Fix .ssh permissions

PROG="$(basename $0)"

SOURCE="git.directi.com::user-files"

# check if rsync point is live
rsync -q $SOURCE
if [ $? -ne 0 ]; then
    echo "$PROG: rsync fatal error" >&2
    exit 1
fi

# since the rsync mount point itself is a git clone
# ignore ., .git, .gitignore, etc.
# i.e. only consider non-dot dirs
rsync $SOURCE | awk '/^d/ && $NF !~ /^\./ { print $NF }' \
| while read user ; do
    getent passwd $user > /dev/null
    if [ $? -ne 0 ]; then
        echo "$user doesn't exist" >&1
        continue
    fi
    
    userhome="$(getent passwd $user | cut -f 6 -d : )"

    if [ ! -d "$userhome" ]; then
        gid="$(id $user | sed -re 's/^.* gid=([0-9]+)[^0-9].*$/\1/')"
        # create $USERHOME if it doesn't exist
        install -d -o $user -g $gid -m 0750 $userhome
    fi
    
    if [ -d "$userhome" ]; then
        # rsync as user for ownership
        su -c "rsync -vr --exclude=.git $SOURCE/$user/ $userhome/" $user
        # fix permissions on .ssh
        chmod 0700 $userhome/.ssh
        chmod 0600 $userhome/.ssh/authorized_keys
    fi
done
