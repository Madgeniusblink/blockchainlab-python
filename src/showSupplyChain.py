import json
from web3 import Web3

ganache_url = "http://127.0.0.1:8545"
web3 = Web3(Web3.HTTPProvider(ganache_url))

web3.eth.defaultAccount = web3.eth.accounts[0]

with open('abi/SupplyChain.abi') as f:
    abi = json.load(f)

address = web3.to_checksum_address('0x5FbDB2315678afecb367f032d93F642f64180aa3') 
# Initialize supplyChain contract
contract = web3.eth.contract(address=address, abi=abi)

productCount = contract.functions.product_id().call()
participantCount = contract.functions.participant_id().call()
transferCount = contract.functions.owner_id().call()


print()
print('Products: ',productCount)
print('Participants: ',participantCount)
print('Ownership transfers: ',transferCount)

# Display the participants 
for i in range (0, participantCount):
    print(contract.functions.participants(i).call())

print('Participants: ',contract.functions.participant_id().call())