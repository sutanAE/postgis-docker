# postgis-docker



conf file at 
```
container:/etc/postgresql/12/main
```

data dir at 

```
container:/var/lib/postgresql/12/main
```

## Building Note

```pg_hba.conf``` is set to trust from the localhost; of course this should not be the case. Initiate a password!