  export TAG=alpine-perl:5.30.0

  docker build -t $TAG
  docker tag $TAG tempire/$TAG
  docker push $TAG
