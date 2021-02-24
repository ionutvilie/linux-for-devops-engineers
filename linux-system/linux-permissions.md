# Permissions

* chmod - change file mode bits
* chown - change file owner and group

## Understanding the security permissions

```bash
$ ls -alh 
-rwxrwxrwx 1 ubuntu ubuntu   16 Jul  2 09:29 metasyntactic-vars
drwxrwxrwx 2 ubuntu ubuntu 4.0K Jul  2 18:05 shared

# type  user  group  other  user    group  
# -     rwx   rwx     rwx   ubuntu  ubuntu 
# d     rwx   rwx     rwx   ubuntu  ubuntu
```

### User, group and others

* user – The user permissions apply only the owner of the file or directory, they will not impact the actions of other users.
* group – The group permissions apply only to the group that has been assigned to the file or directory, they will not effect the actions of other users.
* others – The others permissions apply to all other users on the system, this is the permission group that you want to watch the most.

### Read, Write and Execute

* `r` stands for read 
* `w` stands for write 
* `x` stands for execute 
* `-` it is a file
* `d` it is a directory

### Changing security permissions with `chmod`

#### The _ugoa_ notations

A combination of the letters ugoa controls which users access to the file will be changed: the user who owns it \(u\), other users in the file's group \(g\), other users not in the file's group \(o\), or all users \(a\). If none of these are given, the effect is as if \(a\) were given, but bits that are set in the umask are not affected.

1. Removing every permission and start clean

```bash
$ chmod 000 shared/
$ ls -lh 
-rwxrwxrwx 1 ubuntu ubuntu   16 Jul  2 09:29 metasyntactic-vars
d--------- 2 ubuntu ubuntu 4.0K Jul  2 18:05 shared
```

1. Add read, write and execute \(`rwx`\) to user

```bash
$ chmod u+rwx shared/
$ ls -lh
-rwxrwxrwx 1 ubuntu ubuntu   16 Jul  2 09:29 metasyntactic-vars
drwx------ 2 ubuntu ubuntu 4.0K Jul  2 18:05 shared
```

1. Add read and write \(`rw`\) to group

```bash
$ chmod g+rw shared/
$ ls -lh 
-rwxrwxrwx 1 ubuntu ubuntu   16 Jul  2 09:29 metasyntactic-vars
drwxrw---- 2 ubuntu ubuntu 4.0K Jul  2 18:05 shared
```

1. Add read \(`r`\) to others

```bash
$ chmod o+r shared/
$ ls -lh 
-rwxrwxrwx 1 ubuntu ubuntu   16 Jul  2 09:29 metasyntactic-vars
drwxrw-r-- 2 ubuntu ubuntu 4.0K Jul  2 18:05 shared
```

1. Remove execute \(`x`\) from user

```bash
$ chmod u-x shared/
$ ls -lh 
-rwxrwxrwx 1 ubuntu ubuntu   16 Jul  2 09:29 metasyntactic-vars
drw-rw-r-- 2 ubuntu ubuntu 4.0K Jul  2 18:05 shared
```

1. Remove \(`w`\) from group

```bash
$ chmod g-w shared/
$ ls -l 
-rwxrwxrwx 1 ubuntu ubuntu   16 Jul  2 09:29 metasyntactic-vars
drw-r--r-- 2 ubuntu ubuntu 4.0K Jul  2 18:05 shared
```

1. Combinations 

```bash
chmod +x script.sh             # makes script executable by all similar to: chmod a+x script.sh
chmod u=rwx,g=rx,o=rx shared/  # change permissions for user group and others at the same time
```

#### The octal notations

| Octal | Binary | File Mode |
| ---: | :---: | :--- |
| 0 | 000 | --- |
| 1 | 001 | --x |
| 2 | 010 | -w- |
| 3 | 011 | -wx |
| 4 | 100 | r-- |
| 5 | 101 | r-x |
| 6 | 110 | rw- |
| 7 | 111 | rwx |

Using the octal notations table instead of `r`, `w` and `x`. Each digit octal notation can be used of either of the group `u`,`g`,`o`.

Examples:

```bash
chmod 777 shared/  # u=rwx,g=rwx,o=rwx
chmod 744 shared/  # u=rwx,g=r,o=r
chmod 755 shared/  # u=rwx,g=rx,o=rx
```

1. change recursively 

```bash
$ tree tmp/test/
tmp/test/
├── bar
│   └── metasyntactic-vars
├── buz
│   └── metasyntactic-vars
└── foo
    ├── metasyntactic-vars
    └── shared

# for me recursively changing permissions using ugoa notation did not work
# chmod -R u=rw,g=r,o=r shared/  # change permissions for user group and others at the same time
chmod -R 644 shared/  # change permissions for user group and others at the same time
```

### Changing ownership with `chown`

Command `chown` changes the user and/or group ownership of each given file. If only an owner \(a user name or numeric user ID\) is given, that user is made the owner of each given file, and the files' group is not changed. If the owner is followed by a colon and a group name \(or numeric group ID\), with no spaces between them, the group ownership of the files is changed as well. If a colon but no group name follows the user name, that user is made the owner of the files and the group of the files is changed to that user's login group. If the colon and group are given, but the owner is omitted, only the group of the files is changed; in this case, `chown` performs the same function as `chgrp`. If only a colon is given, or if the entire operand is empty, neither the owner nor the group is changed

```bash
chown root /foo           # Change the owner of /u to "root".
chown root:staff /bar     # Likewise, but also change its group to "staff".
chown -hR root /buz       # Change the owner of /u and subfiles to "root".

$ sudo ls -hlR
drwxr--r-- 2 root   staff  4.0K Jul  2 13:56 bar
drwxr--r-- 2 root   staff  4.0K Jul  2 09:29 buz
drwxr--r-- 3 root   ubuntu 4.0K Jul  2 18:05 foo
./bar:
-rwxr--r-- 1 ubuntu ubuntu 16 Jul  2 13:56 metasyntactic-vars
./buz:
-rwxr--r-- 1 root   staff  16 Jul  2 09:29 metasyntactic-vars
./foo:
-rwxr--r-- 1 ubuntu ubuntu   16 Jul  2 09:29 metasyntactic-vars
drwxr--r-- 2 ubuntu ubuntu 4.0K Jul  2 18:05 shared
./foo/shared:

# changing back
sudo chown -R ubuntu:ubuntu ../
ubuntu@raspberrypi-01:~/tmp/test$ ls -lhR

drwxr--r-- 2 ubuntu ubuntu 4.0K Jul  2 13:56 bar
drwxr--r-- 2 ubuntu ubuntu 4.0K Jul  2 09:29 buz
drwxr--r-- 3 ubuntu ubuntu 4.0K Jul  2 18:05 foo
./bar:
-rwxr--r-- 1 ubuntu ubuntu 16 Jul  2 13:56 metasyntactic-vars
./buz:
total 4.0K
-rwxr--r-- 1 ubuntu ubuntu 16 Jul  2 09:29 metasyntactic-vars
./foo:
-rwxr--r-- 1 ubuntu ubuntu   16 Jul  2 09:29 metasyntactic-vars
drwxr--r-- 2 ubuntu ubuntu 4.0K Jul  2 18:05 shared
./foo/shared:
```

