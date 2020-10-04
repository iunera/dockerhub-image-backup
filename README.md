# dockerhub-image-backup

## TL;DR

Downloads all images (max. 100) with all tags found by a given Searchstring `SEARCHSTRING`.

```
docker build -t dockerhub-image-backup .
```

```
docker run -it \
  -e SEARCHSTRING=iunera \
  -v /var/run/docker.sock:/var/run/docker.sock \
  dockerhub-image-backup:latest docker ps
```
