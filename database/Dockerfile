FROM postgres:15-alpine

ENV TZ=America/Sao_Paulo

COPY ./scripts/init_db.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
