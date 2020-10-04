# dockerhub-image-backup

## TL;DR

Downloads all images (max. 100) with all tags found by a given Searchstring `SEARCHSTRING`.

```
docker run -it \
  -e SEARCHSTRING=iunera \
  -v /var/run/docker.sock:/var/run/docker.sock \
  iunera/dockerhub-image-backup:latest
```

## Build
```
docker build -t dockerhub-image-backup .
```
