export TAG=alpine-perl:5.32.0

docker build -t $TAG .
docker tag $TAG tempire/$TAG
docker push tempire/$TAG
