# Scripting

## Linux scripting 

### hello world

Running the hello-world.sh script will result in the below output \(output tab\)

{% tabs %}
{% tab title="Script" %}
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

{% tab title="Files" %}
{% file src=".gitbook/assets/hello-world.sh" caption="hello-world.sh" %}
{% endtab %}
{% endtabs %}

### fun coffee break script

{% file src=".gitbook/assets/coffee-break-script.sh" caption="Coffee Break Script" %}

### tools

[https://www.shellcheck.net/](https://www.shellcheck.net/) - finds bugs in your shell scripts.

