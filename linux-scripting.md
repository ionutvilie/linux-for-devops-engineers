# Scripting

## Linux scripting 

### hello world

Running the hello-world.sh script will result in the below output \(output tab\)

{% file src=".gitbook/assets/hello-world.sh" %}

{% tabs %}
{% tab title="hello-world.sh" %}
```bash
#!/usr/bin/env bash
message="Hello World"

printf "with printf: %s\n" "${message}" # POSIX Way
echo   "with echo: ${message}"          # Not portable
```
{% endtab %}

{% tab title="Output" %}
```bash
$ ./hello-world.sh 
with printf: Hello World
with echo: Hello World
```
{% endtab %}
{% endtabs %}

### tools

[https://www.shellcheck.net/](https://www.shellcheck.net/) - finds bugs in your shell scripts.

