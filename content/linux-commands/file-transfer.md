---
title: "File transfer"
date: 2023-07-05T08:19:54+03:00
weight: 25
draft: false
---

Transfer files between servers

## `scp`

scp — OpenSSH secure file copy

```bash
# cp remote file to work dir
scp ubuntu@raspberrypi-live:~/work/readme.md ~/work
# cp file to remote dir
scp ~/work/readme.md ubuntu@raspberrypi-live:~/work/
```

## `rsync`

rsync - a fast, versatile, remote (and local) file-copying tool

It is famous for its delta-transfer algorithm, which reduces the amount of data sent over the network by sending only the differences between the source files and the existing files in the destination.

```bash
# sync current dir to remote dir
rsync -avz . ubuntu@raspberrypi-live:~/work
# sync remote dir to current dir
rsync -avz ubuntu@raspberrypi-live:~/work .
```
