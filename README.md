# friday.sh: simple bash scripts to automate everyday tasks
"It's almost weekend and i'm done for the week" said no developer ever. Well it's hard to get all things done by friday and have a peaceful weekend, but atleast you can keep those micro tasks from bugging you while you try to sleep. With friday.sh you can now rest for the weekend (hopefully?).

### Motivation
![motivation](https://raw.githubusercontent.com/venkatselvan/friday.sh/master/motivation.png)

### Getting Started
1. Clone this repo into your "Go to dev" folder
`git clone https://github.com/venkatselvan/friday.sh`
2. Make the script executable
`chmod +x friday.sh/*/*.sh`

### List of available scripts
* `essentials/`
  * `wp_backup.sh` - Creates backup of your wordpress site into a .zip file
   `./wp_backup.sh --site /var/www/website --db database --out output.zip`

### For Help
Run `./script.sh --help`

### Further Development
This is a spare time project I have created to automate repeated tasks I do on ongoing basis. If you feel you can contribute to this, please submit a pull request.

### Tips to contribute
1. Please ensure to write only in bash
2. Please ensure to check if necessary commands exists before running the operation, if they don't exist either install using `cmd_install` or prompt user to install them before proceeding.
3. Please ensure to cleanup any temporary files at the end of script
4. Have fun coding!
