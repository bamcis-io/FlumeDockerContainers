# BAMCIS Flume Docker Containers

This repo contains Flume Docker Containers running both Alpine Linux and
Debian Linux using OpenJDK 8.

## Options

These containers will generally not be ready to use "as-is". The `flume.conf` file will need to be tailored to
the desired setup. The template is provided as an example for streaming from Kafka topics to HDFS. In addition
to the `flume.conf` file, the `flume.env` file used in `docker-compose.yml` will also need to be updated for your
specific use case. In the example, the HDFS server and Kafka servers are defined there. 

In the **`flume-debain`**  variant, the `entrypoint.sh` script would also need to be updated with any environment 
variables you define in `su --login "${FLUME_USER}" --command "..."` line so that they are available to the flume 
user account in order to perform the automatic environment variable replacement in the `flume.conf` file. You'll
see in the template that it uses the environment variables `${KAFKA_SERVERS}` and `{HDFS_NAMENAME}`.

## Usage

* Adjust the `flume.conf` file to suit your needs
* Run `.\build.ps1` in the flume-alpine or flume-debian directory
* Adjust the `docker-compose.yml` file to contain as flume instances as desired, this defaults to 2. They are all part
of the same group id.
* Run `docker-compose up`