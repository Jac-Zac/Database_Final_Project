<h1 align="center">
    Database Final Project 🤖
</h1>

# Project requirements

Install [Beekeeper Studio (Community Edition)](https://github.com/beekeeper-studio/beekeeper-studio)

#### To get started:

> Documentation can be found [hear](https://dev.mysql.com/doc/mysql-installation-excerpt/8.0/en/docker-mysql-getting-started.html)

- ##### Login into docker hub:

```
docker login
```

- ##### Start a MySQL server instance and pull it if needed:

```
docker run -p 13306:3306 --name mysql_uni_project -e MYSQL_ROOT_HOST=% -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
```

> Access a terminal to the docker container
> docker exec -it mysql_uni_project /bin/sh

- ##### Connect to mysql from the terminal

```
mysql --host=127.0.0.1 --port=13306 -u root -p
```

> if you need to install the database after you have the connection you can just write

```
source mysqlsampledatabase.sql
```

> if this database is in your directory

### Logic Schema

The logic schema can be found in [this link](https://dbdiagram.io/d/64fd90bf02bd1c4a5e4826a8)

# TODO

- [ ] Complete the project
- [ ] Restructure the README.md following previous repo you created

Difference between where and grup by (having va doop grup by)
Be carefull on the constraints
