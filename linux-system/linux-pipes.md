# Pipes

In order to understand why pipes let's look at the UNIX philosophy:

1. Make each program do one thing well. To do a new job, build afresh rather than complicate old programs by adding new "features".
2. Expect the output of every program to become the input to another, as yet unknown, program. Don't clutter output with extraneous information. Avoid stringently columnar or binary input formats. Don't insist on interactive input.

###  Pipes 

In Linux, the `pipe` command lets you send the output of one command to another. Piping, as the term suggests, can redirect the standard output, input, or error of one process to another for further processing.

The syntax for the `pipe` or `unnamed pipe` command is the `|` character between any two commands:

```bash
# syntax
# command-1 | command-2 | command-3
$ echo -e "alfa\nbeta\ngama" 
alfa
beta
gama
$ echo -e "alfa\nbeta\ngama" | grep -n beta
2:beta
$ echo -e "alfa\nbeta\ngama" | grep -n beta | tr a-z A-Z
2:BETA
BETA
```

In the above commands, we first print the first 3 letters of the Greek alphabet, we then extract gamma and it's line number, and last make the word uppercase. We used 2 pipes.  

### Named Pipes

One of the key differences between regular pipes and named pipes is that named pipes have a presence in the file system and a name :\). That is, they show up like files. But unlike most files, they never appear to have contents. Even if you write a lot of data to a named pipe, the file appears to be empty.

A named pipe transfers messages one by one first in first out.  A named pipe can be created with `mkfifo` command.   

{% tabs %}
{% tab title="Bash" %}
```bash
$ mkfifo my-named-pipe
$ ls -al my-named-pipe 
prw-r--r--  1 ionut.ilie  staff  0 Oct  4 20:23 my-named-pipe
# let's write 5 numbers in a pipe
for i in {1..5}; do echo "number $i" > my-named-pipe ; done
# it maight apear as stuck but it actualy waits for a consumer
# move about command in bg or open a new terminal and
# start a consumer for the pipe
tail -f my-named-pipe 


```
{% endtab %}

{% tab title="Bash-2" %}
```
# start a consumer for the pipe
$ tail -f my-named-pipe 
number 1
number 2
number 3
number 4
number 5
```
{% endtab %}
{% endtabs %}



