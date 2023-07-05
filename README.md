# Intro

## Install Hugo Mac

```bash
# what are tests ?
(
  export VERSION=0.115.1
  cd ${HOME}/Downloads
  curl -L -o hugo_darwin-universal.tar.gz https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_darwin-universal.tar.gz
  tar --extract --file=hugo_darwin-universal.tar.gz hugo
  mv hugo ${HOME}/bin
  chmod +x ${HOME}/bin/hugo
  rm hugo_darwin-universal.tar.gz
)
```

## Serve with Hugo

```bash
hugo serve
```

## Create content

```bash
# hugo new index.md
hugo new --kind chapter intro/_index.md
hugo new --kind chapter linux-system/_index.md
hugo new --kind chapter linux-commands/_index.md
hugo new --kind chapter linux-scripting/_index.md
hugo new --kind chapter linux-homework/_index.md
```
