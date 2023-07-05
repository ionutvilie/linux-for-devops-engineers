---
title: "Processes"
date: 2023-07-05T08:19:54+03:00
weight: 25
draft: false
---

## List processes

### `top` & `htop`

* `top` provides a dynamic real-time view of a running system. More details in `man top`.
* `htop` It is similar to `top`, but allows you to scroll vertically and horizontally, so you can see all the processes running on the system, along with their full command lines, as well as viewing them as a process tree, selecting multiple processes and acting on them all at once. More details in `man htop`.

```bash
top
top -U ubuntu  # top user processes
htop
```

### `ps`

ps displays information about a selection of the active processes.

```bash
ps -ef                                       # (-e) list all processes and (-f) do full-format listing
ps axjf        #   ps -ejH                   # To print a process tree
ps axms        #   ps -eLf                   # To get info about threads
ps -eo euser,ruser,suser,fuser,f,comm,label  # To get security info
ps axZ         #   ps -eM                    # To get security info
ps -u ubuntu                                 # list only ubuntu user processes
ps -eo pid,nice,user,args --sort nice        # user-defined format
ps -eo '%p %n %u %a' --sort nice             # same as above but with aix format descriptors
```

### `pstree`

display a tree of processes

```bash
pstree
pstree -a
pstree -a -C age
```

### `pidof`

Find the process ID of a running program.

```bash
$ pidof dockerd         # find the pid of a program
2000
$ pidof -x ./script.sh  # find the pid of a script
38908
```

### `kill`, `pkill` & `killall`

* kill - send a signal to a process
* pgrep, pkill - look up or signal processes based on name and other attributes

```bash
kill [PID]                #
kill -9 [PID]             # SIGKILL aka force kill
kill -15 [PID]            # SIGTERM aka  nice kill
kill -l                   # list all signals

pgrep -u root dockerd     # Find the process ID of the dockerd daemon
pkill -HUP syslogd        # Make syslog reread its configuration file
renice +4 $(pgrep chrome) # Make all chrome processes run nicer
```

## Scheduling

A kernel scheduler is a unit of the kernel that determines the most suitable process out of all runnable processes to execute next. The scheduler forms the core of multitasking in Linux. It ranks processes based on the most deserving as well as the need for CPU time

One important characteristic of Linux is dynamic priority-based scheduling, which allows the nice value of processes to be changed \(increased or decreased\) depending on your needs, as we’ll see later on.

Niceness values range from -20 \(most favorable to the process\) to 19 \(least favorable to the process\).

### `nice` & `renice`

* nice - run a program with modified scheduling priority
* renice - alter the priority of running processes

```bash
# -e Select all processes.
# -o user-defined format
nice -5 tar -czf backup.tar.gz /home/ubuntu   # nice -PRIORITY COMMAND
ps -eo pid,nice,user,args --sort nice         # determine the niceness of a command
$ ps -eo pid,nice,user,args | grep dockerd
   2000   0 root     /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
$ renice -n -2  -u dockerd
# or
$ renice -n -2  -p 2000
```

### `nohup`

Run a command immune to hangups, with output to a non-tty

```bash
nohup backup-database.sh    # execute a long running command
nohup backup-database.sh &  # execute a long running command and continue to work in terminal
```

## Job Controlling commands

```bash
# create a dummy script that appends a date to a temp file
$ printf "%s\n%s\n"  '#!/bin/bash' 'while true; do echo $(date --rfc-3339=seconds) >>/tmp/running.test ; sleep 1 ; done' > script.sh
$ chmod +x script.sh            # add execute flag to script
$ ./script.sh                   # run script
$ ctrl+z                        # hit control + z
^Z
[1]+  Stopped                 ./script.sh
$ jobs                          # list jobs
[1]+  Stopped                 ./script.sh
$ bg %1                         # run job 1 in background
$ tail -10f /tmp/running.test   # check if script is running in background
2020-07-02 17:26:54+00:00       # <>
2020-07-02 17:27:10+00:00       # time when job was stopped with ctrl+z
2020-07-02 17:27:11+00:00
2020-07-02 17:27:12+00:00
jobs
[1]+  Running                 ./script.sh &
kill %1                        # kill job with id 1
$ jobs
[1]+  Terminated              ./script.sh
$ ./script.sh
^Z
[1]+  Stopped                 ./script.sh
stop %1                       # stops a bg process
```

### References:

* [tecmint: linux-process-priority](https://www.tecmint.com/set-linux-process-priority-using-nice-and-renice-commands/)
* [tlpd: Job Control Commands](https://www.tldp.org/LDP/abs/html/x9644.html)
* linux man pages
