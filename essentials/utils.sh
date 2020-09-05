#!/bin/sh

# Detect Platform
PLATFORM=''
case "$(uname -s)" in

   Darwin)
     PLATFORM='macos'
     ;;

   Linux)
     PLATFORM='linux'
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     PLATFORM='windows'
     ;;

   *)
     PLATFORM='other'
     ;;
esac

# Parse arguments passed to file and assign to a variable (with the same name)
while [ $# -gt 0 ]; do

   if [[ $1 == "--help" ]]; then
      declare help="yes"
   elif [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi

  shift
done

# Predefined color schemes
if [ $PLATFORM == macos ]; then
  GREEN='\033[0;32m'
  LIGHTGREEN='\033[1;32m'
  LIGHTBLUE='\033[01;34m'
fi

if [ $PLATFORM == linux ]; then
  GREEN='\e[32m'
  LIGHTGREEN='\e[92m'
  LIGHTBLUE='\e[94m'
fi

# Usage: cmd_install zip "brew install zip" "sudo apt-get install zip"
# $1 - Command
# $2 - Macos Installation Command
# $3 - Linux Installation Command
function cmd_install()
{
  if [ -z $(which $1) ]; then
    echo "Installing $1"
    if [ $PLATFORM == macos ]; then
      eval $2
    elif [ $PLATFORM == linux ]; then
      eval $3
    fi
    echo "Installed $1 at $(which $1)"
  else
    echo "Found $1 at $(which $1)"
  fi
}

# Usage: cmd_exit_if_not_available mysqldump "Please install mysqldump to run the script"
# $1 - Command
# $2 - Exit message
function cmd_exit_if_not_available()
{
  if [ -z $(which $1) ]; then
    echo $2
    exit 1
  else
    echo "Found $1 at $(which $1)"
  fi
}