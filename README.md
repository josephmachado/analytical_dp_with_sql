## Getting started

### Prerequisites

1. [Docker](https://docs.docker.com/engine/install/) with at least 4GB of RAM and [Docker Compose](https://docs.docker.com/compose/install/) v1.27.0 or later
2. [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

**Windows users**: please setup WSL and a local Ubuntu Virtual machine following **[the instructions here](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-10#1-overview)**. Install the above prerequisites on your ubuntu terminal, if you have trouble installing docker follow **[the steps here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04#step-1-installing-docker)**. All the commands shown here should be run inside the ubuntu virtual machine.

**Mac/Linux users** Please run the commands shown below in your terminal.

Clone this repo

```shell
git clone https://github.com/josephmachado/analytical_dp_with_sql.git
cd analytical_dp_for_data_engineers
```

### How to run

#### Minio

Open local `http://localhost:9001` and use username: minio and password: minio123.

#### Trino Credentials
Open local `http://localhost:8080` and use username: any-value.

### Commands

```shell
make up # spin up containers
make trino # Open trino CLI for writing queries
make down # spin down containers
```

### Trino CLI

When you run the `make trino` command you will enter the Trino CLI.

```sql
q -- To exit view mode, which is activated when you run any select query
Exit; -- To exit trino
```

### ERD

![TPCH ERD](./images/tpch_erd.png)

##### References

1. [TPC](https://www.tpc.org/tpch/)