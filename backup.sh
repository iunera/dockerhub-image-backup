#!/bin/bash

[ -z "$SEARCHSTRING" ] && echo "SEARCHSTRING not set" && exit 1

image_list=$(docker search --limit 100 ${SEARCHSTRING} --format "{{ .Name}}")

for image in ${image_list}
do
  
  echo "Working on $image ..."
  i=0
  while [ $? == 0 ]
  do 
    i=$((i+1))
    tag_list_thispage=$(curl https://registry.hub.docker.com/v2/repositories/${image}/tags/?page=$i 2>/dev/null|jq --jsonargs ".\"results\"[][\"name\"] | \"${image}:\(.)\"")
    if test -z "$tag_list_thispage"
    then
      break
    else
      image_tag_list=("${image_tag_list[@]}" "${tag_list_thispage[@]}")
      echo "found tags ${#image_tag_list[@]}"
    fi
  done
  all_images=("${all_images[@]}" "${image_tag_list[@]}")
  echo ${all_images[*]}
done

echo pulling "${#all_images[@]} images"

for image in ${all_images[*]}
do
  echo Final:
  echo $image
  docker pull $(echo $image | xargs)
done
