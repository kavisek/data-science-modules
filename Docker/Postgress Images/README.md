### Postgress Container

Starting a local docker container

```bash
docker run -d --name my_postgres -v my_dbdata:/var/lib/postgresql/data -p 54320:5432 postgres:11
```

### View Database Logs

View the logs of the docker container.

```bash
docker logs -f my_postgres
```

### Connecting to the Database

Connect to the datbase using this command.

```bash
# connect to the database via bash
docker exec -it my_postgres psql -U postgres

```

Now we can run SQL command in terminal again the database

```sql
-- View the current databases
\d

-- Check the current version of Postgres
SHOW server_version;


-- Disconnect from Postgres server
\q
```

### Connecting to Database via Postico

Now that the datbase is running within a docker container. We can now connect to this database


![Images](Images/postico_image.png)

## Creating Conda Enviroment
```
conda create -n postgres python=3.6 \
&& source activate postgresql \
&& pip install psycopg2-binary \
&& conda install -c anaconda sqlalchemy \
```


### References

https://www.saltycrane.com/blog/2019/01/how-run-postgresql-docker-mac-local-development/
