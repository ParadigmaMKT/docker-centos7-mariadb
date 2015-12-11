# docker-centos7-mariadb

Custom MariaDB image based on CentOS 7 original mariadb Dockerfile (https://github.com/CentOS/CentOS-Dockerfiles/tree/master/mariadb/centos7)

This image is data persistence ready with volumes mount point.

Use with docker-compose, expose local port for external access via MySQL client:
```yaml
  ports:
    - "3306:3306"
```

Data persistence:
```yaml
  volumes:
    - ./src/data/mysql:/var/lib/mysql
```

You can set the environment vars:
```yaml
  env_file:
    - './db.env'
```

db.env file example:
```
# db.env
MYSQL_ROOT_PASSWORD=MyRoot
MYSQL_DATABASE=MyDB
MYSQL_USER=MyUser
MYSQL_PASSWORD=MyPassword
```