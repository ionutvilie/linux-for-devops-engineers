# Linux Commands

```bash
packer@host01:~$ uptime
 10:20:50 up  1:14,  1 user,  load average: 0.04, 0.01, 0.00
packer@host01:~$ whoami
packer
packer@host01:~$ date
Wed 24 Feb 2021 10:21:01 AM UTC
packer@host01:~$ 
```

Most of the Linux commands are compiled binaries that reside on the local filesystem, they are usually stored in some `*bin/` directory.
- `/bin/` system binaries
- `/usr/bin/` system binaries
- `/home/<user>/bin/` user custom binaries

You can locate a particular binary using: 

```bash
packer@host01:~$ which perl
/usr/bin/perl
packer@host01:~$ whereis perl
perl: /usr/bin/perl /usr/bin/perl5.30-x86_64-linux-gnu /usr/lib/x86_64-linux-gnu/perl /etc/perl /usr/share/perl /usr/share/man/man1/perl.1.gz
```

