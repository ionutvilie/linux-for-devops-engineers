---
title: "Linux Scripting"
date: 2023-07-05T08:19:54+03:00
weight: 31
draft: false
---

Linux scripting

### hello world

Running the hello-world.sh script will result in the below output \(output tab\)

{{< tabs title="hello-world" >}}
{{% tab title="Script" %}}
```bash
#!/usr/bin/env bash
message="Hello World"

printf "with printf: %s\n" "${message}" # POSIX Way
echo   "with echo: ${message}"          # Not portable
```
{{% /tab %}}

{{% tab title="Output" %}}
```bash
$ ./hello-world.sh
with printf: Hello World
with echo: Hello World
```
{{% /tab %}}

{{% tab title="Files" %}}
[hello-world.sh](/assets/hello-world.sh)
{{% /tab %}}
{{< /tabs >}}

### fun coffee break script

[Coffee Break Script](/assets/coffee-break-script.sh)

### tools

[https://www.shellcheck.net/](https://www.shellcheck.net/) - finds bugs in your shell scripts.
