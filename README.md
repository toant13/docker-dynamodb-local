# dynamodb-local

docker for local dynamodb

#### Commands
```sh
./build : to build docker image
./run : to run docker image
./stop : to stop docker image 
```

#### To validate Dynamo is running (need aws cli installed)
```sh
aws dynamodb list-tables --endpoint-url http://localhost:8000
```
