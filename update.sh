for repository in $(docker image ls --format '{{.Repository}}')
do
  docker pull ${repository}:master
done
