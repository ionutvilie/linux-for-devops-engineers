# Working with text files

## `head` & `tail`

* head - output the first part of files
* tail - output the last part of files

```bash
head /var/log/syslog             # Print the first 10 lines to standard output
head -n 1 /var/log/syslog        # print first line to stdout
tail -20  /var/log/syslog        # print last 30 lines from syslog
tail -20f  /var/log/syslog       # print last 30 lines from syslog and follow
```

## `diff`

compare files line by line

```bash
diff  /tmp/test/foo/metasyntactic-vars /tmp/test/bar/metasyntactic-vars    
diff -c /tmp/test/foo/metasyntactic-vars /tmp/test/bar/metasyntactic-vars  # context
diff -u /tmp/test/foo/metasyntactic-vars /tmp/test/bar/metasyntactic-vars  # unified
```

## `grep`

Stands for Global Regular Expression Print. grep, egrep, fgrep, rgrep - print lines that match patterns

```bash
$ grep foo /tmp/test/foo/metasyntactic-vars     # search foo in /tmp/test/foo/metasyntactic-vars file
foo
$ grep -v foo /tmp/test/foo/metasyntactic-vars  # list everything but foo in /tmp/test/foo/metasyntactic-vars file
bar
buz
quz
grep -i FOO /tmp/test/foo/metasyntactic-vars    # same as above, i sands for ignore case
$ grep -r buz /tmp/test/                        # search recursively for buz in all files from /tmp/test dir
/tmp/test/buz/metasyntactic-vars:buz
/tmp/test/bar/metasyntactic-vars:buz
/tmp/test/foo/metasyntactic-vars:buz
$ egrep "foo|bar" /tmp/test/foo/metasyntactic-vars  # search for both foo and bar in file
foo
bar
```

## `tr`

stands for translate

```bash
# replace spaces with new lines
echo 'alpha beta gamma delta alpha beta gamma delta' | tr " " "\n"
```

## `sort` & `uniq`

sort - sort lines of text files uniq - report or omit repeated lines \(works with sorted lines\)

```bash
# sorts the line
echo 'alpha beta gamma delta alpha beta gamma delta' | tr " " "\n" | sort 
# shows uniq lines
echo 'alpha beta gamma delta alpha beta gamma delta' | tr " " "\n" | sort | uniq
# prefix lines by the number of occurrences
echo 'alpha beta gamma delta beta gamma delta' | tr " " "\n" | sort | uniq -c
```

## `awk`

awk \(gawk\) - pattern scanning and processing language

```bash
$ echo 'a|b|c' | awk -F "|" '{print $2}'
b
$ echo 'a b c' | awk '{print $2}'
b
cat /etc/passwd | awk -F ":" '{printf "%-25s %s\n" , $1, $7}'  # print user and shell
cat /etc/passwd | awk -F ":" '{printf "%-25s %s\n" , $1, $NF}' # print user and shell $NF is the last column
```

## `sed`

sed - stream editor for filtering and transforming text

```bash
$ echo 'a b b c' | sed 's/b/x/'    # substitutes first encountered `b`
a x b c
$ echo 'a b b c' | sed 's/b/x/g'   # substitutes globally all `b`
a x x c
```
