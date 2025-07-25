FROM python:3.11-slim as builder

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN apt-get update \
    && apt-get install -y build-essential gcc \
    && pip install --upgrade pip

COPY ./requirements.txt /app/
RUN pip install --prefix=/install --no-cache-dir -r requirements.txt

FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY --from=builder /install /usr/local

COPY ./src /app/src

RUN mkdir -p /app/uploads

EXPOSE 8081

ENV DATABASE_HOST=db
ENV DATABASE_USER=root
ENV DATABASE_PASS=secret
ENV DATABASE_DBNAME=db_prova
ENV UPLOAD_DIR=/app/uploads

CMD ["uvicorn", "src.main:api", "--host", "0.0.0.0", "--port", "8081"]
