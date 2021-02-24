# Basic Commands

Environment: [https://www.katacoda.com/courses/ubuntu/playground2004](https://www.katacoda.com/courses/ubuntu/playground2004)

## Others

### `tar`

An archive utility

```bash
tar -cvf test.tar /tmp/test/     # Create Verbosely Filename
tar -cvzf test.tar.gz /tmp/test/ # Create Verbosely gzip Filename
# instructs tar to change dir to /tmp/test and start create archive from there 
tar --strip-components=1 -cvzf test.tar.gz -C /tmp/test/ .       

tar -tvf test.tar.gz             # List Verbosely archive content

tar -xvf test.tar                # Extract Verbosely Archive
tar -xvf test.tar.gz             # Extract Verbosely gzip Archive
# extract a single file from an archive 
tar --extract --file=test.tar.gz tmp/test/foo/metasyntactic-vars
```

### `lsof`

List open files. Useful to see what application is running on some port.

```bash
$ lsof -i                # show open files in this case TCP/UDP ports (might require root)
$ sudo lsof -i :8080     # find what application is running and listen for connections on port 8080
COMMAND    PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
docker-pr 2282 root    4u  IPv6  53248      0t0  TCP *:http-alt (LISTEN)
$ ps -ef | grep 2282     # find out more about the PID
root        2282    2000  0 Jun23 ?        00:00:01 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8080 -container-ip 172.17.0.2 -container-port 8080
```

### `read`

read - reads from stdin into variables.

```bash
$ echo "alpha beta gamma delta" | while read A B C D ; do echo $D $C $B $A ; done
delta gamma beta alpha
$ echo "alpha beta gamma delta" | while read first_word rest_of_the_line; do echo $first_word ; done
alpha
$ echo "alpha beta gamma delta" | while read first_word rest_of_the_line; do echo $rest_of_the_line ; done
beta gamma delta
```

## TODO

```bash
ln                      #  
nslookup google.ro      # query Internet name servers
ping                    # ping a remote host, ping uses ICMP type 8 (echo message) and type 0 (echo reply message)
                        # some host block ICMP giving a false-positive of unreachable host                    

crontab                 #
regex                   #
xargs                   #
eval                    #
trap                    # trap
```

## Other

* [https://www.linuxtrainingacademy.com/linux-commands-cheat-sheet/](https://www.linuxtrainingacademy.com/linux-commands-cheat-sheet/)
* [https://cheatography.com/davechild/cheat-sheets/linux-command-line/](https://cheatography.com/davechild/cheat-sheets/linux-command-line/)

