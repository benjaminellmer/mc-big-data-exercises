# postgres

Docker composer file to provide a PostgreSQL database v14.

```  
cd <path-to-your-Docker>
```  

```  
git clone https://github.com/Digital-Media/postgres.git
```  

```  
cd postgres
```  


```  
docker compose up -d
```  

```  
docker exec -it postgres /bin/bash -c "psql -U postgres"
```  
