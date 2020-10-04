# Scripting

## Linux scripting 



### hello world

Running the script will result in the below output \(output tab\)

{% tabs %}
{% tab title="hello-world.sh" %}
```text
#!/usr/bin/env bash
message="Hello World"

printf "with printf: %s\n" "${message}" # POSIX Way
echo   "with echo: ${message}"          # Not portable
```
{% endtab %}

{% tab title="Output" %}
```text
$ ./hello-world.sh 
with printf: Hello World
with echo: Hello World
```
{% endtab %}
{% endtabs %}

### tools

[https://www.shellcheck.net/](https://www.shellcheck.net/) - finds bugs in your shell scripts.

