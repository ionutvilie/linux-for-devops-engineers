# Basic Commands

Note
> Some of the code command examples start with `$` and some are not. 
> This is intended to show which is a command and which is the command output

Environment:  https://www.katacoda.com/courses/ubuntu/playground2004

## `pwd` 

Lists path of the current working directory (folder)

```bash
$ pwd
/home/ubuntu
```

## `cd` 

Change directory command is used to change the current working directory 

```bash
$ cd /var/log/journal/   # cd to /var/log
$ pwd
/var/log/journal/
$ cd ..                   # cd one path up
$ cd ../..                # cd two paths up, etc
$ cd                      # cd to home dir
$ cd -                    # cd to previous dir
```

## `ls` 

Lists the contents of a directory

```bash
ls /var/log/
ls -a /var/log/         # do not ignore entries starting with . (hidden files)
ls -l /var/log/         # use a long listing format
ls -alh /var/log/       # human-readable with -l and -s, print sizes like 1K 234M 2G etc.
ls -ltr /var/log/       # t (sort by modification time, newest first) r (reverse order while sorting)
```

## `cat` 

Short for concatenate, it is used to list the contents of a file on the standard output (sdout)

```bash
$ cat metasyntactic-vars.txt 
foo
bar
buz
qux
```

## `cp` 

Copy Files

```bash
cp metasyntactic-vars.txt metasyntactic-vars  
```

## `mv` 

Move or Rename Files

```bash
$ mv metasyntactic-vars metasyntactic-variables   # rename file
$ mv metasyntactic-vars.txt /tmp/                 # move file to /tmp dir
$ ls /tmp
metasyntactic-vars.txt
$ mv /tmp/metasyntactic-vars.txt .                # move file to current location
```

## `mkdir` & `rmdir`

Make a new directory or remove dir

```bash
mkdir /tmp/foo                     # make a new dir foo in /tmp
mkdir -p /tmp/bar/foo              # make a new dir foo in /tmp/bar and create parent directories as needed
mkdir -p /tmp/test/{foo,bar,buz}   # make dirs foo bar buz in /tmp/test/ and create parent directories as needed
rmdir /tmp/foo                     # removes a non-empty directory
```

## `rm`

Remove files or directories.

```bash
rm /tmp/foo                 # removes a non-empty directory
rm -r /tmp/bar/foo          # removes foo directory
rm metasyntactic-vars.txt   # removes metasyntactic-vars.txt file
```

## `locate`

locate a file

```bash
locate syslog
```

## `find`

Search for a file. 

```bash
find . -name testfile.txt	       # find a file called testfile.txt in current and sub-directories.
find /home/ubuntu -name *.txt	   # find all .txt files in the /home/ubuntu.
find /var/ -name sys* 2>/dev/null  # find everything that starts with sys in /var/ and sub-directories
                                   # and redirect errors to /dev/null
# https://www.tecmint.com/35-practical-examples-of-linux-find-command/
```

## `grep`

Stands for Global Regular Expression Print.
grep, egrep, fgrep, rgrep - print lines that match patterns

```bash
$ grep foo /tmp/test/foo/metasyntactic-vars     # search foo in /tmp/test/foo/metasyntactic-vars file
foo
$ grep -v foo /tmp/test/foo/metasyntactic-vars  # list everything but foo in /tmp/test/foo/metasyntactic-vars file
bar
buz
quz
grep -i FOO /tmp/test/foo/metasyntactic-vars    # same as above, i sands for ignore case
$ grep -r buz /tmp/test/                        # search recursively for buz in all files from /tmp/test dir
/tmp/test/buz/metasyntactic-vars:buz
/tmp/test/bar/metasyntactic-vars:buz
/tmp/test/foo/metasyntactic-vars:buz
$ egrep "foo|bar" /tmp/test/foo/metasyntactic-vars  # search for both foo and bar in file
foo
bar
```

## `df` & `du`

- `df` - report file system disk space usage
- `du` - estimate file space usage

```bash 
$ df -h  /dev/mmcblk0*   # h human-readable
Filesystem      Size  Used Avail Use% Mounted on
udev            1.9G     0  1.9G   0% /dev
/dev/mmcblk0p1  253M   99M  154M  39% /boot/firmware
/dev/mmcblk0p2   15G  3.5G   11G  26% /

$ du -sh /mnt/sgt2t/     # s display only a total for each argument 
633G	/mnt/sgt2t/
```

## `head` $ `tail`

- head - output the first part of files
- tail - output the last part of files

```bash
head /var/log/syslog             # Print the first 10 lines to standard output
head -n 1 /var/log/syslog        # print first line to stdout
tail -20  /var/log/syslog        # print last 30 lines from syslog
tail -20f  /var/log/syslog       # print last 30 lines from syslog and follow 

```

## `diff`

compare files line by line

```bash
diff  /tmp/test/foo/metasyntactic-vars /tmp/test/bar/metasyntactic-vars    
diff -c /tmp/test/foo/metasyntactic-vars /tmp/test/bar/metasyntactic-vars  # context
diff -u /tmp/test/foo/metasyntactic-vars /tmp/test/bar/metasyntactic-vars  # unified
```

## `tar`

An archive utility 

```bash
tar -cvf test.tar /tmp/test/     # Create Verbosely Filename
tar -cvzf test.tar.gz /tmp/test/ # Create Verbosely gzip Filename
# instructs tar to change dir to /tmp/test and start create archive from there 
tar --strip-components=1 -cvzf test.tar.gz -C /tmp/test/ .       

tar -tvf test.tar.gz             # List Verbosely archive content

tar -xvf test.tar                # Extract Verbosely Archive
tar -xvf test.tar.gz             # Extract Verbosely gzip Archive
# extract a single file from an archive 
tar --extract --file=test.tar.gz tmp/test/foo/metasyntactic-vars 
```

## `lsof`

List open files. Useful to see what application is running on some port.

```bash
$ lsof -i                # show open files in this case TCP/UDP ports (might require root)
$ sudo lsof -i :8080     # find what application is running and listen for connections on port 8080
COMMAND    PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
docker-pr 2282 root    4u  IPv6  53248      0t0  TCP *:http-alt (LISTEN)
$ ps -ef | grep 2282     # find out more about the PID
root        2282    2000  0 Jun23 ?        00:00:01 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8080 -container-ip 172.17.0.2 -container-port 8080
```

## `telnet`

User interface to the TELNET protocol. Useful to test remote open ports.

```bash
# port is open but refused to accept telnet connection
$ telnet 192.168.100.128 8080     
Trying 192.168.100.128...
telnet: connect to address 192.168.100.128: Connection refused
telnet: Unable to connect to remote host
# port is not open
$ telnet 192.168.1.128 8081
Trying 192.168.1.128...
^C
```


## TODO

```bash
nslookup google.ro      # query Internet name servers
ping                    # ping a remote host, ping uses ICMP type 8 (echo message) and type 0 (echo reply message)
                        # some host block ICMP giving a false-positive of down host                    


```

## Other

https://www.linuxtrainingacademy.com/linux-commands-cheat-sheet/
https://cheatography.com/davechild/cheat-sheets/linux-command-line/