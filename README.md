# Blockchain Lab

## Requirements

- Python 3.10 or later
- Poetry
- Docker
- Foundry

## Instructions for Using the Makefile

Pull the Docker Image:
This will download the latest stable version of GETH from Docker Hub.

```make pull```

Start the GETH Service:
This command starts the GETH Docker container with the defined ports and data volume for blockchain data persistence.

```make start```

Stop the GETH Service:
Stops and removes the GETH container.

```make stop```

View Logs:
Outputs logs from the GETH Docker container to help monitor activities or troubleshoot.

```make logs```
# blockchainlab-python
