# Linux Filesystem

A simple description of the UNIX system, also applicable to Linux, is this:

"On a UNIX system, everything is a file; if something is not a file, it is a process."

This statement is true because there are special files that are more than just files (named pipes and sockets, for instance), but to keep things simple, saying that everything is a file is an acceptable generalization. A Linux system, just like UNIX, makes no difference between a file and a directory, since a directory is just a file containing names of other files. Programs, services, texts, images, and so forth, are all files. Input and output devices, and generally all devices, are considered to be files, according to the system.

In order to manage all those files in an orderly fashion, man likes to think of them in an ordered tree-like structure on the hard disk, as we know from MS-DOS (Disk Operating System) for instance. The large branches contain more branches, and the branches at the end contain the tree's leaves or normal files. For now we will use this image of the tree, but we will find out later why this is not a fully accurate image.

## File Types


The -l option to ls displays the file type, using the first character of each input line:

```bash
$ ls -l
total 8.0K
-rwxr--r-- 1 ubuntu ubuntu   16 Jul  2 09:29 metasyntactic-vars
drwxr--r-- 2 ubuntu ubuntu 4.0K Jul  2 18:05 shared
```

| Symbol | Meaning |
|---:|:------------|
| -	| Regular file |
| d	| Directory    |
| l	| Link         |
| c	| Special file |
| s	| Socket       |
| p	| Named pipe   |
| b	| Block device |

- regular files contain normal data, for example text files, executable files or programs.
- Directories: files that are lists of other files.
- Special files: the mechanism used for input and output. Most special files are in /dev
- Links: a system to make a file or directory visible in multiple parts of the system's file tree
- (Domain) sockets: a special file type, similar to TCP/IP sockets, providing inter-process networking protected by the file system's access control.
- Named pipes: act more or less like sockets and form a way for processes to communicate with each other, without using network socket semantics.


## Partition layout and types

There are two kinds of major partitions on a Linux system:

- data partition: normal Linux system data, including the root partition containing all the data to start up and run the system; and
- swap partition: expansion of the computer's physical memory, extra memory on hard disk.

## Mount points

All partitions are attached to the system via a mount point. The mount point defines the place of a particular data set in the file system. Usually, all partitions are connected through the root partition. On this partition, which is indicated with the slash (/), directories are created. 

```bash 
$ df -h  /dev/mmcblk0*   # h human-readable
Filesystem      Size  Used Avail Use% Mounted on
udev            1.9G     0  1.9G   0% /dev
/dev/mmcblk0p1  253M   99M  154M  39% /boot/firmware
/dev/mmcblk0p2   15G  3.5G   11G  26% /
/dev/sda2       1.8T  633G  1.1T  37% /mnt/sgt2t
$ du -sh /mnt/sgt2t/     # s display only a total for each argument 
633G	/mnt/sgt2t/
```

During system startup, all the partitions are thus mounted, as described in the file /etc/fstab

```bash
cat /etc/fstab 
LABEL=writable	/	 ext4	defaults	0 0
LABEL=system-boot       /boot/firmware  vfat    defaults        0       1
# mount seagate 2T drive
UUID=98db3b27-e3fa-4cfe-906f-bcbd4db335b7 /mnt/sgt2t ext4    errors=remount-ro,auto,exec,rw,user 0       0

```

## Subdirectories of the root directory

Linux file system starts with /, the root directory. All other directories are 'children' of this directory.

```bash
/bin -> usr/bin     # contains binaries (applications os programs you can run)
/boot               # !! contains files required for starting your system
/dev                # !! contains device files
/etc                # a place for system-wide configuration files
/home               # Home directories of the common users, eg /home/ubuntu this is accessible to only
                    # the user and system admin
/lib -> usr/lib     # libraries necessary for some application to run
/lost+found         # contains recovered bits of corrupted files
/media              # is where external storage will be automatically mounted when you plug it in and try to access it
/mnt                # a place to manually mount storage devices or partitions
/opt                # a place to install system-wide third party software 
/proc               # !! contains information about your computer, such as information about your CPU
/root               # !! is the home directory of the superuser (also known as the “Administrator”) of the system
/run                # !! System processes use it to store temporary data
/sbin -> usr/sbin   # superuser binaries (applications os programs you can run)
/snap               # a place for snap applications
/srv                # server data (http, sftp)
/sys                # contains information from devices connected to the machine
/tmp                # contains temporary files
/usr                # contains system-wide shared data
/var                # Contains variable data like system logging files, 
                    # mail and printer spool directories, and transient and temporary files
```

## The file system in reality

For most users and for most common system administration tasks, it is enough to accept that files and directories are ordered in a tree-like structure. The computer, however, doesn't understand a thing about trees or tree-structures.

Every partition has its own file system. By imagining all those file systems together, we can form an idea of the tree-structure of the entire system, but it is not as simple as that. In a file system, a file is represented by an inode, a kind of serial number containing information about the actual data that makes up the file: to whom this file belongs, and where is it located on the hard disk.

Every partition has its own set of inodes; throughout a system with multiple partitions, files with the same inode number can exist.

At the time a new file is created, it gets a free inode. In that inode is the following information:

- Owner and group owner of the file.
- File type (regular, directory, ...)
- Permissions on the file Section 3.4.1
- Date and time of creation, last read and change.
- Date and time this information has been changed in the inode.
- Number of links to this file (see later in this chapter).
- File size
- An address defining the actual location of the file data.

The only information not included in an inode, is the file name and directory. These are stored in the special directory files. By comparing file names and inode numbers, the system can make up a tree-structure that the user understands. Users can display inode numbers using the -i option to ls. The inodes have their own separate space on the disk.

```bash
df -i /dev/sda2 
Filesystem        Inodes IUsed     IFree IUse% Mounted on
/dev/sda2      122085376 30050 122055326    1% /mnt/sgt2t
``` 



#### Sources: 

- https://tldp.org/LDP/intro-linux/html/sect_03_01.html
- https://www.linux.com/training-tutorials/linux-filesystem-explained/  
- https://www.tldp.org/LDP/Linux-Filesystem-Hierarchy/html/the-root-directory.html