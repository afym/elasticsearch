## 1. En la carpeta docker/

#### Setting up the local environment
```
$ cd elasticsearch/
$ docker-compose up -d
$ docker/setup.sh
```

#### Testing the elastic search cluster
```
$ curl -XGET 'http://localhost:9200'
```

#### Testing the kibana
```
$ curl -XGET 'http://localhost:5601'
```

# Basic structure of curl
```
$ curl -X<VERB> '<PROTOCOL>://<HOST>/<PATH>?<QUERY_sTRING>' -d '<BODY>'
```