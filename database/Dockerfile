
FROM postgres:16
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=animals
COPY init.sql /docker-entrypoint-initdb.d/
