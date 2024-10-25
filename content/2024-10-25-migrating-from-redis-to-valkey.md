---
title: Migrating from Redis 7.4+ to Valkey
author: mbentley
layout: post
date: 2024-10-25
url: /2024/10/migrating-from-redis-74-to-valkey/
categories:
  - computers
  - docker
  - internet
  - linux
  - technology

---
There are [many][1] [blog][2] [posts][3] about your migration options from Redis to Valkey but if you're wanting to do an in place swap, one thing that has come up is that Redis 7.4's RDB format isn't compatible with Redis so if you've upgraded Redis to 7.4, this complicates things a bit. I found myself in this exact situation which is described in this [GitHub issue][4] because I have been using the `redis:7-alpine` Docker image and auto-updating it when new versions are available. As user `bigb4ng` [points out][5], there is a cli based tool, [`rdb-cli`][8] which can read data from a dump file and output it to a Valkey server to achieve your data migration. While not quite the swap that you might have been hoping for, it's a nice workaround.

So why a blog post? Well, I found that the instructions for compiling [rdb-cli][8] were fine but details about the expected build environment weren't great. If you know me, I am 100% going to build a Docker image to do just that which helped me figure out that Ubuntu 22.04 worked well for the use case after having issues on Debian Bookworm and Ubuntu 24.04. You can check out the GitHub repo ([mbentley/docker-rdb-cli][6]) where I have some basic instructions and a Dockerfile if you wish to build the image, otherwise it's already available on [Docker Hub][7].

Let's do a quick walkthrough of what migration looks like using some basic Redis and Valkey containers to give you an idea of the process. We will create a Redis container, create some example data, ensure it is saved to disk, start up a Valkey container, migrate the data using `rdb-cli` to the valkey container, and then verify that the data was migrated.

1. Create a Redis container:

   **Note**: Here, we are just using a Docker named volume `redis-data` for temporary data use. Adapt this method to your use case when performing your actual migration.

   ```bash
   $ docker run -d \
     --name redis \
     -v redis-data:/data \
     redis:7-alpine
   91a7e3d1d823f0bf7a9451c0118e380c0b4c731bac9ef09482625301a2774c67
   ```

1. Write a few key/value pairs to have some data for validation:

   ```bash
   $ docker exec -it redis redis-cli SET foo bar
   OK
   $ docker exec -it redis redis-cli SET baz qux
   OK
   ```

1. Make sure to force Redis to save the data to the dump file:

   ```bash
   # check when the last save was
   $ docker exec -it redis redis-cli LASTSAVE
   (integer) 1729871115

   # initiate a non-blocking save
   $ docker exec -it redis redis-cli BGSAVE
   Background saving started

   # check when the last save was to verify it had completed
   $ docker exec -it redis redis-cli LASTSAVE
   (integer) 1729871385
   ```

1. Stop the `redis` docker container:

   ```bash
   $ docker stop -t 30 redis
   redis
   ```

1. Start a Valkey docker container:

   ```bash
   $ docker run -d \
     --name valkey \
     -v valkey-data:/data \
     valkey/valkey:8-alpine
   5107f008b16d0ee5075efc047e62c30dc03f66571f2db11fd4b3d1aa67a9fdaf
   ```

1. Verify that there is no data in our Valkey container's database:

   ```bash
   $ docker exec -it valkey valkey-cli KEYS '*'
   (empty array)
   ```

1. Using the persistent data volume from the `redis` container, run the `rdb-cli` command:

   **Note**: we are re-using the container network from the valkey container so that it's available as localhost; this simplifies our experiment.

   ```
   $ docker run -it --rm \
     --network=container:valkey \
     -v redis-data:/data \
     -w /data \
     mbentley/rdb-cli \
       rdb-cli /data/dump.rdb -l /dev/stdout redis -h 127.0.0.1 -p 6379
   INFO  : RDBX_createReaderFile: Initialized with file /data/dump.rdb
   INFO  : Finalizing parser configuration
   INFO  : Number sets of handlers registered at level RAW/STRUCT/DATA: 1/0/1
   INFO  : Start processing RDB source
   INFO  : The parsed RDB file version is: 12
   WARN  : Target Redis version is not configured! Set it to Redis version: 7.4
   INFO  : rdbversion=12
   INFO  : Parser done
   ```

1. Verify that the data has been transferred to our Valkey container's database:

   ```bash
   $ docker exec -it valkey valkey-cli KEYS '*'
   1) "foo"
   2) "baz"
   ```

1. Cleanup from our experiement:

   ```bash
   # remove the containers
   $ docker rm -f redis valkey
   redis
   valkey

   # remove the volumes
   $ docker volume rm redis-data valkey-data
   redis-data
   valkey-data

   # remove the images
   docker rmi redis:7-alpine valkey/valkey:8-alpine
   Untagged: redis:7-alpine
   Deleted: sha256:de13e74e14b98eb96bdf886791ae47686c3c5d29f9d5f85ea55206843e3fce26
   Untagged: valkey/valkey:8-alpine
   Deleted: sha256:75010b6854cb5ba6a0b1540d1bd3238541a31e3f8018cd31f9e5b92bb3192fa6
   ```

[1]: https://www.percona.com/blog/valkey-redis-migrating-to-valkey/
[2]: https://fedoramagazine.org/how-to-move-from-redis-to-valkey/
[3]: https://www.kloia.com/blog/redis-to-valkeydb-migration-guide
[4]: https://github.com/valkey-io/valkey/issues/845
[5]: https://github.com/valkey-io/valkey/issues/845#issuecomment-2308270054
[6]: https://github.com/mbentley/docker-rdb-cli
[7]: https://hub.docker.com/r/mbentley/rdb-cli
[8]: https://github.com/redis/librdb
