#!/bin/bash

PREFIX="lcc"
LOG="$PWD/single.log"

set -o pipefail

# ------------------------------------
if [ -z "$AMS_ROOT_V9" ]; then
   echo "ERROR: This installation script works only in the Infinity environment!"
   exit 1
fi

# ------------------------------------------------------------------------------
module add cmake

# ------------------------------------------------------------------------------
# update revision number
VERS="5.`git rev-list --count HEAD`.`git rev-parse --short HEAD`"
if [ $? -ne 0 ]; then exit 1; fi

# names ------------------------------
NAME="dynutil"
ARCH="noarch"
MODE="single" 
echo "Build: $NAME:$VERS:$ARCH:$MODE"
echo ""

# build and install software ---------
cmake -DCMAKE_INSTALL_PREFIX="$SOFTREPO/$PREFIX/$NAME/$VERS/$ARCH/$MODE" . | tee $LOG
if [ $? -ne 0 ]; then exit 1; fi
make install | tee -a $LOG
if [ $? -ne 0 ]; then exit 1; fi


# prepare build file -----------------
SOFTBLDS="$SOFTREPO/$PREFIX/_ams_bundle/blds/"
cd $SOFTBLDS || exit 1
VERIDX=`ams-bundle newverindex $NAME:$VERS:$ARCH:$MODE`

cat > $NAME:$VERS:$ARCH:$MODE.bld << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!-- Advanced Module System (AMS) build file -->
<build name="$NAME" ver="$VERS" arch="$ARCH" mode="$MODE" verindx="$VERIDX">
    <setup>
        <variable name="AMS_PACKAGE_DIR" value="$PREFIX/$NAME/$VERS/$ARCH/$MODE" operation="set" priority="modaction"/>
        <variable name="PATH" value="\$SOFTREPO/$PREFIX/$NAME/$VERS/$ARCH/$MODE/bin" operation="prepend"/>
    </setup>
</build>
EOF
if [ $? -ne 0 ]; then exit 1; fi

echo ""
echo "Rebuilding bundle ..."
ams-bundle rebuild | tee -a $LOG
if [ $? -ne 0 ]; then exit 1; fi

echo "LOG: $LOG"
echo ""

