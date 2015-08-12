# Table of contents
- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)

# Introduction
This repository contains some [Vagrant] files and Shell scripts to compare performance of different
VN (virtual network) implementations using [Docker] and [qperf].

For each VN one directory exist which contains the `Vagrantfile` as well as `run_server.sh` and
`run_client.sh`. Vagrant is starting two CoreOS machines for each implementation to test.
Check [Usage](#usage) to see how to run the tests.

# Requirements
Following requirements must be fulfilled to run the tests:
- Linux system
- [Git]
- [Vagrant]

# Installation
- Clone the repository
```shell
$ git clone http://github.com/Nosmoht/docker-virtual-network-comparison.git
```

- Change into the directory
```shell
$ cd docker-virtual-network-comparison
```

# Usage

- Change into the directory of a VN to test
```shell
$ cd [docker-bridge|weave|flannel-udp|flannel-vxlan]
```

- Start the virtual machines
```shell
$ vagrant up
```

- Start the Docker Container running qperf in server mode
```shell
$ ./run_server.sh
```

- Start the Docker Container running qperf in client mode. This will output
the benchmark result ten times as the test is done in a loop from one to ten.
```shell
$ ./run_client.sh
```

# Author
[Thomas Krahn]

[Docker]: https://www.docker.com/
[Git]: https://git-scm.com/downloads
[Thomas Krahn]: mailto:ntbc@gmx.net
[qperf]: http://linux.die.net/man/1/qperf
[Vagrant]: https://www.vagrantup.com/
