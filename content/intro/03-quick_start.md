---
title: "Quick Start"
date: 2023-07-05T08:19:54+03:00
weight: 7
# categories: ["intro"]
# tags: "intro"
---

## Don't

* Make the user `root` \(system administrator's account\) accessible via ssh.
* Run applications as root, applications might contain a vulnerability if the application is compromised it can run malicious code as root.
* copy/paste `rm select * from ...` in your console, careful with what you have in your system clipboard.

## Avoid

* configuring server logins with user and password.
* using root user as a system admin, you can make mistakes.
* using globbing `*`, `*` matches any string, including the empty string. eg: `rm *`

## Shells

The shell is a program that takes commands from the keyboard and gives them to the operating system to perform. Shells are usually run via a terminal emulator, this is a program that opens a window and lets you interact with a shell.

Popular shells: bash, zsh, ksh, dash, sh

### Using Bash features

| Key or key combination | Function |
| :--- | :--- |
| Ctrl+A | Move the cursor to the beginning of the command line |
| Ctrl+C | End a running program and return the prompt |
| Ctrl+D | Log out of the current shell session, equal to typing `exit` or `logout` |
| Ctrl+E | Move the cursor to the end of the command line |
| Ctrl+H | Generate backspace character |
| Ctrl+L | Clear this terminal |
| Ctrl+R | Search command history |
| Ctrl+Z | Suspend a program |
| ArrowLeft and ArrowRight | Move the cursor one place to the left or right on the command line |
| ArrowUp and ArrowDown | Browse history. Go to the line that you want to repeat, edit details if necessary, and press Enter to save time. |
| Tab | Command or filename completion |
| Tab Tab | Shows file or command completion possibilities |

## Getting help

```bash
# man [command]
man ls           # see manual for ls command
# command --help (long)
ps --help        # print program help
```
