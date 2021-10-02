#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
DARK_GRAY='\033[1;30m'
NO_COLOR='\033[0m'
GO_VERSION="$1"

switch_go_version(){
   new_version=$1
   # print current version

   OLD=$(go version)
   echo -e $DARK_GRAY"current version:"
   echo -e $ORANGE$OLD

   # link new go root foler (GOROOT should pointing to here.)
   ln -sfn $HOME/sdk/$new_version $HOME/sdk/go


   # print new version
   NEW=$(go version)
   echo -e $DARK_GRAY"switch to version:"
   echo -e $GREEN$NEW
   echo -e $DARK_GRAY"done."

   exit 0
}


### start program switch ###
if [ -n "$GO_VERSION" ]; then

  # check if go version already download or not.
  `$GO_VERSION version`

  if [ $? -eq 0 ]; then
     switch_go_version $GO_VERSION
  else
    read -r -p "$ORANGEdo you want to download $GO_VERSION? [Y/n]" input
    case $input in
      [yY][eE][sS]|[yY])

     `go get -v golang.org/dl/$GO_VERSION`

     if [ $? -ne 0 ]; then
        echo -e $RED"Not found $GO_VERSION on golang.org/dl."
        exit 1
     fi

     `$GO_VERSION download`

     switch_go_version $GO_VERSION
    ;;
      [nN][oO]|[nN])
      echo "bye."
    ;;
      *)
      echo -e $DARK_GRAY"exit."
      exit 1
    ;;
   esac

  fi

else
  echo -e $RED"please pass the version."
  echo -e $RED"example ./switch.sh go1.13.8"
  echo -e $RED"script will be find folder go1.13.8 to change version."
fi

