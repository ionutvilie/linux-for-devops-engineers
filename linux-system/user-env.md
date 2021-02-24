# User Environnement

### `.profile`

`.profile` is the first file it is loaded by the shell when a user opens one. 
If this is missing it might be `.bash_profile`. 
if you have a `.bash_profile` and you create a `.profile` then profile is loaded first

You can easily lock a user by adding a `exit` statement in the `.profile` file :)

### `PATH`

The execution flow of a particular application is given by it's location in the `PATH` env variable. 
Lets say i inherit a default PATH env from the default machine configuration that has some outdated binary and i want to use the new version.
i can change this without the help of sysadmin by adding the location of the new binary in front of the old one in the `PATH` env var

```bash
packer@host01:~$ echo $PATH
/root/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
packer@host01:~$ PATH=/home/packer/bin/:$PATH
packer@host01:~$ echo $PATH
/home/packer/bin/:/root/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

### `LD_LIBRARY_PATH`

Same as PATH but for libraries.