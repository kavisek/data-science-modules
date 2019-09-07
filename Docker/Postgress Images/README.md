### Postgress Container


```bash
docker run -d --name my_postgres -v my_dbdata:/var/lib/postgresql/data -p 54320:5432 postgres:11
```

### Connecting to Database via Postico

![Images](Images/postico_image.png)

## Creating Conda Enviroment
```
conda create -n postgres python=3.6 \
&& source activate postgresql \
&& pip install psycopg2-binary \
```












### References

https://www.saltycrane.com/blog/2019/01/how-run-postgresql-docker-mac-local-development/
