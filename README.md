## Prometheus Salt State and Client configuration

This repository contains SaltStack states for installing and configuring the Prometheus monitoring system. It is intended for my personal use but it should be structured so it can be used or modified by anyone.

## Overview

There are two main components of this configuration, the `server.sls` state and the `client.sls` state.

 `server.sls` does the following:

1. **User and Group Creation**: Sets up a prometheus user and group to run the Prometheus service.
2. **Prometheus Installation**: Downloads, extracts and installs the Prometheus binary (version 2.48.1) from the official source.
3. **Configuration Management**: Manages the Prometheus configuration and service files.

`client.sls` does the following:

1. **Installation of client agent:** Downloads and installs `node-exporter` to provide metrics to the Prometheus server.

## Usage

1. **Clone the Repository**: Clone this repository to your Salt master or appropriate location.
2. **Customize**: Modify the `prometheus.yml` and `prometheus.service` files in the `files` directory as needed for your setup.
3. **Apply the States**: Target your intended nodes and apply the respective state.

## TODO: 
- Client State
  - Node Exporter... works for most cases?
  - Config files


## License

This project is open-sourced under the [MIT License](LICENSE).
