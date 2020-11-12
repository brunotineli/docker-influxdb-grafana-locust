# docker-influxdb-grafana-locust

**Assumptions**  
- Docker
- Docker compose
- Makefile


**Run tests**  
- Build dependencies like influxdb, chronograf and grafana
````   
make run-dependencies
````  

- Run tests inside docker
````   
make docker-run-tests
````  

- Development environment inside docker
````   
make docker-dev-environment
````  