# Setup

Please install the following software:

1. [git version >= 2.37.1](https://github.com/git-guides/install-git)
2. [Docker version >= 20.10.17](https://docs.docker.com/engine/install/) and [Docker compose v2 version >= v2.10.2](https://docs.docker.com/compose/#compose-v2-and-the-new-docker-compose-command). Make sure that docker is running using `docker ps`. 

**Windows users**: please setup WSL and a local Ubuntu Virtual machine following **[the instructions here](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-10#1-overview)**. Install the above prerequisites on your ubuntu terminal; if you have trouble installing docker, follow **[the steps here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04#step-1-installing-docker)** (only Step 1 is necessary). Please install the make command with `sudo apt install make -y` (if its not already present). 

All the commands shown below are to be run via the terminal (use the Ubuntu terminal for WSL users). We will use docker to set up our containers. Clone and move into the lab repository, as shown below.

```bash
git clone \
https://github.com/josephmachado/analytical_dp_with_sql.git 
cd analytical_dp_with_sql
```

**Note**: If you are using Macbook M1, please follow [the instructions here](https://github.com/josephmachado/analytical_dp_with_sql/issues/4#issuecomment-1426902080) to use the appropriate docker image.

We have some helpful make commands to make working with our systems more accessible. Shown below are the make commands and their definitions

1. make up: Spin up the docker containers.
2. make trino: Open trino cli; Use exit to quit the cli. **This is where you will type your SQL queries**.
3. make down: Stop the docker containers.

You can see the commands in [this Makefile](https://github.com/josephmachado/analytical_dp_with_sql/blob/main/Makefile). If your terminal does not support **make** commands, please use the commands in [the Makefile](https://github.com/josephmachado/analytical_dp_with_sql/blob/main/Makefile) directly. All the commands in this book assume that you have the docker containers running.

In your terminal, do the following:

```bash
# Make sure docker is running using docker ps
make up # starts the docker containers
sleep 60 # wait 1 minute for all the containers to set up
make trino # opens the trino cli
```

In Trino, we can connect to multiple databases (called catalogs in Trino). TPC-H is a dataset used to benchmark analytical database performance. Trino's tpch catalog comes with preloaded tpch datasets of different sizes tiny, sf1, sf100, sf100, sf300, and so on, where sf = scaling factor.

```sql
-- run "make trino" or 
-- "docker container exec -it trino-coordinator trino" 
-- to open trino cli

USE tpch.tiny;
SHOW tables;
SELECT * FROM orders LIMIT 5;
-- shows five rows, press q to quit the interactive results screen
exit -- quit the cli
```

**Note**: Run `make trino` or `docker container exec -it trino-coordinator trino` on your terminal to open the trino cli. The SQL code shown throughout the book assumes you are running it in trino cli.

Starting the docker containers will also start Minio(S3 alternative); we will use Minio as our data store to explain efficient data storage.

**UI**: Open the Trino UI at http://localhost:8080 (username: any word) and Minio (S3 alternative) at http://localhost:9001 (username: minio, password: minio123) in a browser of your choice. 

# Data Model

The [TPC-H](https://www.tpc.org/tpch/) data represents a car parts seller's data warehouse, where we record orders, items that make up that order (lineitem), supplier, customer, part(parts sold), region, nation, and partsupp.

**Note:** Have a copy of the data model as you follow along; this will help with the examples provided and answering exercise questions.

![TPC-H data model](./images/tpch_erd.png)

# Acknowledgments

We use the [TPC-H](https://www.tpc.org/tpch/) dataset and [Trino](https://trino.io/) as our OLAP DB.
