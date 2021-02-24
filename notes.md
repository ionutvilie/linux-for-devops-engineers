# exercises
https://tldp.org/LDP/intro-linux/html/sect_02_05.html

# Exercises Solutions 


## 01. Quickstart

- What is linux kernel. (keep it simple)

```        
Process 1 in charge with starting the operating system. Handles all operating system processes, such as memory management, task scheduling, I/O, interprocess communication, and overall system control. 
```     

- How can i list kernel name, version and release

```bash
$ uname -srv
Linux 5.4.0-33-generic #37-Ubuntu SMP Thu May 21 12:53:59 UTC 2020
```


- How can i find out the name of the linux Distro i use ? 

```bash        
$ cat /etc/issue
Ubuntu 20.04 LTS \n \l
$ lsb_release -ds
Ubuntu 20.04 LTS
```

- How can i make katacode `PS1` variable show as `$USER@katacode:working directory $`

```bash
$ PS1="${USER}@katacode:\w\$ "
# or
$ PS1="\u@katacode:\w\$ "
root@katacode:~ $ cd /var/log/journal/
root@katacode:/var/log/journal $ cd ../dist-upgrade/
root@katacode:/var/log/dist-upgrade $
```

## 02. Basic Commands

- metasyntactic-vars has 4 lines, on what line is ~~buz~~ bar located, print also one line above and one below 
(2 commands exmples with grep). 

```bash
grep -n bar -C1 metasyntactic-vars 
grep -n bar -A1 -B1 metasyntactic-vars  
```

- metasyntactic-vars has 4 lines, How do i to create a new file without the last 2 lines.
    - use `>` to redirect the output to a new file
    - use `>>` to append the output to a new file

```bash
$ head -n 2 metasyntactic-vars > metasyntactic-vars2
```

- my screenshot folder requires clean-up i want to `find` all `png` files that are older than 1 day.
    
```bash
$ find ~/Documents -name "*.png" -mtime +1
```


- given below file structure how do i remove any other file that is not `metasyntactic-vars`

```bash
$ pwd
/tmp/test
$ ls 
metasyntactic-vars  
metasyntactic-vars.1.log  
metasyntactic-vars.2.log  
metasyntactic-vars.3.log  
metasyntactic-vars.4.log  
metasyntactic-vars.5.log
# use * (globing),  
$ rm metasyntactic-vars.*
```


```
$ awk -F":" '{ printf "%-20s %-40s %-20s\n", $1, $5, $NF }' /etc/passwd
```