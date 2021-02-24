# Exercises

## 01. Quickstart

- What is linux kernel. (keep it simple)

- How can i list kernel name, version and release

        Linux 5.4.0-33-generic #37-Ubuntu SMP Thu May 21 12:53:59 UTC 2020

- How can i find out the name of the linux distro i use ? 
        
        Ubuntu 20.04 LTS \n \l

- How can i make katacode `PS1` variable show as `$USER@katacode:working directory $`

        root@katacode:~ $ cd /var/log/journal/
        root@katacode:/var/log/journal $ cd ../dist-upgrade/
        root@katacode:/var/log/dist-upgrade $

## 02. Basic Commands

- metasyntactic-vars has 4 lines, on what line is buz located, print also one line above and one below 
(2 commands exmples with grep). 

        Desired output: 
        1-foo
        2:bar
        3-buz

- metasyntactic-vars has 4 lines, How do one create a new file without the last 2 lines ?
    - use `>` to redirect the output to a new file
    - use `>>` to append the output to a new file

- my screenshot folder requires clean-up i want to `find` all `png` files that are older than 1 day.

- given below file structure how do i remove any other file that is not `metasyntactic-vars`

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
