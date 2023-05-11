# Linux Administration

&	This operator allows you to run commands in the background of your terminal.
&&	This operator allows you to combine multiple commands together in one line of your terminal.
>	This operator is a redirector - meaning that we can take the output from a command (such as using cat to output a file) and direct it elsewhere.
>>	
This operator does the same function of the > operator but appends the output rather than replacing (meaning nothing is overwritten).
ls -lh: file permissions

https://vim.rtorr.com/

python3 -m  http.server
scp, wget, curl
ps aux
ip a
top
kill %pid
systemctl start
Ctrl + Z: background process
&: background process
fg: bring to foreground
cron/crontabs
https://crontab-generator.org/
https://crontab.guru/
Get user's shell: grep "^$USER" /etc/passwd
Get current linux version: cat /etc/os-release
View Message of the Day (MOTD): sudo nano /etc/motd // cat /etc/update-motd.d/00-header
SSH keys are stored in this directory by default: ~/. ssh/id_rsa

# Get Public IP

curl ifconfig.me

curl wtfismyip.com/json

# Get Bash History 

navigate to home directory
cat .bash_history

# Show user id and current user

id
whoami

# Search a file for a keyword

grep 'word' filename

# Print system environment variables

env

# Rerun last command as sudo

sudo !!

# Navigate to home directory

cd ~
cd

ps





sed

awk




https://betterprogramming.pub/15-essential-linux-command-line-tips-and-tricks-95e2bfa2890f


base_64 decode
openssl_decrpt


https://gist.github.com/johnnypea/b0cd77e5734d65691fa21d93274b305b