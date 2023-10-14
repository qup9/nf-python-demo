$NAME = (Split-Path $PSScriptRoot -Leaf).ToLower()

gcloud auth configure-docker  us-east1-docker.pkg.dev

docker tag $NAME  us-east1-docker.pkg.dev/longo-48734/pass/$NAME 

docker push us-east1-docker.pkg.dev/longo-48734/pass/$NAME 
