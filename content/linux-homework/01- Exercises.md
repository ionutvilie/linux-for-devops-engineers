---
title: "Exercises 1"
date: 2023-07-05T08:19:54+03:00
weight: 41
---

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
- How can I give another user `rwx` access to one of my file (group access) ?
- How can I restrict other users access to one of my file (group access) ?
- How can I make katacode `PS1` variable show as `<user>@<host>:<working directory> $` or `<user>@<host>:katacode $`. How can i make it permanent, how can i make it only for my current session ?

```bash
root@katacode:~ $ cd /var/log/journal/
root@katacode:/var/log/journal $ cd ../dist-upgrade/
root@katacode:/var/log/dist-upgrade $
```
