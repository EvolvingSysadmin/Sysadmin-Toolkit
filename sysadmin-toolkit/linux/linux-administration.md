# Linux Administration

## Linux Administration

### Shell operators

* `&` runs a command in the background of your terminal.
* `&&` combines multiple commands together on one line.
* `>` is a redirector: it takes output from a command, such as `cat` on a file, and directs it elsewhere.
* `>>` does the same as `>` but appends output rather than replacing it, so nothing is overwritten.

### Common commands

```bash
ls -lh                    # long listing with human-readable sizes
python3 -m http.server    # quick local web server
scp / wget / curl         # file transfer
ps aux                    # running processes
ip a                      # interfaces and addresses
top                       # live process view
systemctl start <unit>    # start a service
```

### Job control

* `Ctrl + Z` suspends the foreground process
* `&` appended to a command starts it in the background
* `fg` brings a background job to the foreground
* `kill %1` kills job 1; `kill <pid>` kills by process ID

### Cron

* [crontab generator](https://crontab-generator.org/)
* [crontab.guru](https://crontab.guru/)

### System information

```bash
grep "^$USER" /etc/passwd        # your login shell
cat /etc/os-release              # distribution and version
sudo nano /etc/motd              # message of the day
cat /etc/update-motd.d/00-header # dynamic MOTD header
```

SSH keys live in `~/.ssh/` by default, e.g. `~/.ssh/id_rsa`.

### Get public IP

```bash
curl ifconfig.me
curl wtfismyip.com/json
```

### Vim

[vim.rtorr.com](https://vim.rtorr.com/) is a good cheatsheet.
