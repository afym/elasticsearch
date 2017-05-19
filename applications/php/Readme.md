#### Join to the container
```
$ docker ps
$ docker exec -ti <container-id> bash
$ bash-4.2# php --version
$ bash-4.2# composer --version
```

#### How to install zend expressive (done)

```
$ bash-4.2# composer create-project zendframework/zend-expressive-skeleton
$ bash-4.2# exit
# move the files to src/zend-expressive-skeleton/* to src/*
# change owner src/* to your local user
```

#### Adding a new package
```
# edit your composer.json file and add the dependency
$ bash-4.2# composer update
```