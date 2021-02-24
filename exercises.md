# Exercises

## Day 1

- What is the linux kernel. (keep it simple)

- How can I list the kernel name, version and release

```bash
Linux 5.4.0-33-generic #37-Ubuntu SMP Thu May 21 12:53:59 UTC 2020
```

- How can I find out the name of the linux distro i use ? 
        
```bash
Ubuntu 20.04 LTS \n \l
```

- How can I configure my user environment ?
- How can I to another user rwx access to my files ? 
- How can I restrict other user including group access to my files ?
- How can I make katacode `PS1` variable show as `<user>@<host>:<working directory> $` or `<user>@<host>:<working directory> $`. How can i make it permanent, how can i make it only for my current session ?

```bash
root@katacode:~ $ cd /var/log/journal/
root@katacode:/var/log/journal $ cd ../dist-upgrade/
root@katacode:/var/log/dist-upgrade $
```
- How can I check my disk space. 

```bash 
Filesystem                Size  Used Avail Use% Mounted on
/dev/mapper/primary-root   47G  8.8G   36G  20% /
```

- How can I create a folder structure using only one command ? 

```bash
my-app/
├── config
├── logs
└── utils
```


- metasyntactic-vars has 4 lines, on what line is buz located, print also one line above and one below 
(2 commands exmples with grep). 

```bash
Desired output: 
1-foo
2:bar
3-buz
```

- metasyntactic-vars has 4 lines, How do one create a new file without the last 2 lines ?
    - use `>` to redirect the output to a new file
    - use `>>` to append the output to a new file

- my screenshot folder requires clean-up i want to `find` all `png` files that are older than 1 day, what about once found how can i remove them ?

- given below file structure how do i remove any other file that is not `metasyntactic-vars`, what about files from 3 to 5 ?

```bash
$ mkdir -p /tmp/test && cd /tmp/test
$ echo -e "foo \nbar \nbuz \nquz" > metasyntactic-vars
$ for i in {1..5} ; do cp metasyntactic-vars metasyntactic-vars.${i}.log ;done
$ ls 
metasyntactic-vars  
metasyntactic-vars.1.log  
metasyntactic-vars.2.log  
metasyntactic-vars.3.log  
metasyntactic-vars.4.log  
metasyntactic-vars.5.log
```

- `/etc/groups` is the system file that stores user group information. Hou can i print/filter the groups that user packer is part of ?

- `/etc/passwd` is the system file that stores user information. Hou can i print each user's login shell ? (stored on the last column)
