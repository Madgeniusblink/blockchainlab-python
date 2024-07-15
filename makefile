# Define the GETH Docker image
GETH_IMAGE := ethereum/client-go:stable

# Container name
CONTAINER_NAME := ethereum-geth

# Define ports and data volume for GETH
PORTS := -p 30303:30303 -p 8545:8545 -p 8546:8546 -p 8547:8547
DATA_VOLUME := -v eth-data:/root/.ethereum

.PHONY: pull start stop logs test-sync

# Pull the GETH image from Docker Hub
pull:
	docker pull $(GETH_IMAGE)

# Start the GETH service in a Docker container
start:
	docker run -d --name $(CONTAINER_NAME) $(PORTS) $(DATA_VOLUME) $(GETH_IMAGE) --syncmode "snap"

# Stop and remove the GETH container
stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

# Display logs from the GETH container
logs:
	docker logs -f $(CONTAINER_NAME)

# Test synchronization status of the GETH node
test-sync:
	@echo "Checking synchronization status..."
	@docker exec $(CONTAINER_NAME) geth attach --exec "var sync = eth.syncing; if(sync) { console.log('Syncing: Current block ' + sync.currentBlock + ' / Highest block ' + sync.highestBlock); } else { console.log('Node is fully synchronized.'); }"