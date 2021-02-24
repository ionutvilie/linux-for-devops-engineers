# Working with files and directory's

* "On a UNIX system, everything is a file; if something is not a file, it is a process."
* A directory is just a file containing names of other files

## `pwd`

Lists path of the current working directory \(folder\)

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
$ ls /var/log/
$ ls -a /var/log/         # do not ignore entries starting with . (hidden files)
$ ls -l /var/log/         # use a long listing format
$ ls -alh /var/log/       # human-readable with -l and -s, print sizes like 1K 234M 2G etc.
$ ls -ltr /var/log/       # t (sort by modification time, newest first) r (reverse order while sorting)
```

## `cat`

Short for concatenate, it is used to list the contents of a file on the standard output \(stdout\)

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
# copy source destination
cp metasyntactic-vars.txt metasyntactic-vars
```

## `mv`

Move or Rename Files

```bash
# mv source destination
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

## `file`

Determine file type

```bash
$ file var/log/dmesg
var/log/dmesg: UTF-8 Unicode text, with very long lines
$ file /bin/bash
/bin/bash: ELF 64-bit LSB shared object, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=2ee5bcc1055c34df331b2493918ee6bb7119df1c, for GNU/Linux 3.7.0, stripped
$ file sbin
sbin: symbolic link to usr/sbin
```

## `locate`

locate a file

```bash
locate syslog
```

## `find`

Search for a file.

```bash
find . -name testfile.txt           # find a file called testfile.txt in current and sub-directories.
find /home/ubuntu -name *.txt       # find all .txt files in the /home/ubuntu.
find /var/ -name sys* 2>/dev/null  # find everything that starts with sys in /var/ and sub-directories
                                   # and redirect errors to /dev/null
# https://www.tecmint.com/35-practical-examples-of-linux-find-command/
```
