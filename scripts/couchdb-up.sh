docker container stop couchdb
docker container rm -f couchdb

docker container stop couchdb2
docker container rm -f couchdb2

docker run  -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password --name=couchdb -p 5984:5984 -d couchdb:3.1.1 --restart unless-stopped
docker run  -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password --name=couchdb2 -p 5985:5984 -d couchdb:3.1.1 --restart unless-stopped

sleep 3s

curl localhost:5984
curl localhost:5985
