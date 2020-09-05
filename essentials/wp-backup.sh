#!/bin/sh
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/utils.sh"

echo "${LIGHTBLUE}platform: $PLATFORM \n"

if [[ -d "$help" ]]; then
  echo "${GREEN}Example:"
  echo "${LIGHTGREEN}./wp-backup.sh --site /var/www/website --db database --out output.zip"
  exit 1
fi

tmp_dir=$(mktemp -d -t $db)

echo "${GREEN}Checking Prerequisite..."
cmd_exit_if_not_available mysqldump "Please install mysqldump to run the script"
cmd_install zip "brew install zip" "sudo apt-get install zip"

echo "${GREEN}Zipping $site to a temp directory"
echo sudo zip -r \"$tmp_dir/$db.zip\" $site

echo "${GREEN}Exporting SQL to temp directory"
echo "${LIGHTGREEN}Please enter your mysql username"
read mysql_user

echo "${LIGHTGREEN}Please enter your mysql password"
echo mysqldump -u $mysql_user -p $db > \"$tmp_dir/$db.sql\"

echo "${GREEN}Creating $out from temp directory"
echo sudo zip -r $out \"$tmp_dir/$db.zip\" \"$tmp_dir/$db.sql\"

echo "${GREEN}Cleaning up temp files"
rm -rf $tmp_dir

echo "${LIGHTBLUE}Voila! We are done"
