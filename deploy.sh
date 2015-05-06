#!/bin/bash

IMAGE=registry.deliverous.net/kladier/blog_skillreso

docker build -t $IMAGE .
docker push $IMAGE
curl -X POST http://api.deliverous.com:80/trigger/38d25b2a-364f-4036-a1d8-fcb2e809e720