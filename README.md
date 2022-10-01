## Getting started

### Prerequisites

1. Docker and docker compose
2. git

Clone this repo

```shell
git clone https://github.com/josephmachado/lab
cd lab
```

### Architecture

#### Minio Credentials
  Username: minio
  Password: minio123

#### Trino Credentials
  Username: any-value-will-work

### Commands

```shell
make up # spin up containers
make s3-alternative # open minio UI in your default browser
make trino-ui # open Trino UI in your default browser
make trino # Open trino CLI for writing queries
make down # spin down containers
```

### Trino CLI

When you run the `make trino` command you will enter the Trino CLI.

```sql
q -- To exit view mode, which is activated when you run any select query
Exit; -- To exit trino
```