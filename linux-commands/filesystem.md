# Working with Filesystem

## `df` & `du`

* `df` - report file system disk space usage
* `du` - estimate file space usage

```bash
$ df -h  /dev/mmcblk0*   # h human-readable
Filesystem      Size  Used Avail Use% Mounted on
udev            1.9G     0  1.9G   0% /dev
/dev/mmcblk0p1  253M   99M  154M  39% /boot/firmware
/dev/mmcblk0p2   15G  3.5G   11G  26% /

$ du -sh /mnt/sgt2t/     # s display only a total for each argument 
633G    /mnt/sgt2t/
```
