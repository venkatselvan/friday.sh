#! /bin/bash
# Author: Venkat Selvan
# GitHub: https://github.com/venkatselvan/friday.sh

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/utils.sh"

echo -e "${LIGHTBLUE}platform: $PLATFORM \n"

if [[ ! -z "$help" ]]; then
  echo -e "${GREEN}Example:"
  echo -e "${LIGHTGREEN}./wp-backup.sh --site /var/www/website --db database --out output.zip"
  exit 1
fi

tmp_dir=$(mktemp -d -t "${db}_XXXXXXX")

echo -e "${GREEN}Checking Prerequisite..."
cmd_exit_if_not_available mysqldump "Please install mysqldump to run the script"
cmd_install zip "brew install zip" "sudo apt-get install zip"

echo -e "${GREEN}Zipping $site to a temp directory"
sudo zip -r "$tmp_dir/$db.zip" $site

echo -e "${GREEN}Exporting SQL to temp directory"
echo -e "${LIGHTGREEN}Please enter your mysql username"
read mysql_user

echo -e "${LIGHTGREEN}Please enter your mysql password"
sudo mysqldump -u $mysql_user -p $db > "$tmp_dir/$db.sql"

echo -e "${GREEN}Creating $out from temp directory"
sudo zip -r -j $out "$tmp_dir/$db.zip" "$tmp_dir/$db.sql"

echo -e "${GREEN}Cleaning up temp files"
rm -rf $tmp_dir

echo -e "${LIGHTBLUE}Voila! We are done"