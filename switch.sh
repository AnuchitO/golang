#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
DARK_GRAY='\033[1;30m'
NO_COLOR='\033[0m'
VERSION="$1"

if [ -n "$VERSION" ]; then
  if [ -d "go$VERSION" ]; then
    # print current version
    OLD=`go version`
    echo -e $DARK_GRAY"current version:"
    echo -e $ORANGE$OLD

    rm -rf go
    ln -s go$VERSION go

    # print new version
    NEW=`go version`
    echo -e $DARK_GRAY"switch to version:"
    echo -e $GREEN$NEW
    echo -e $DARK_GRAY"done."
  else
    echo -e $RED"not found folder go$VERSION here."
  fi
else

  echo -e $RED"please pass the version."
  echo -e $RED"example ./switch.sh 1.10."
  echo -e $RED"script will be find folder go1.10 to change version."
fi

