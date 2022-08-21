# NFT creation and deploy
## Setup

- Alchemy account
- ~~Ropsten test network~~ Deprecated
- We will use Polygon 
- Mumbai test network
- https://chainlist.org/
- Connect to metamask
- https://mumbaifaucet.com
- https://composer.alchemyapi.io
    - eth_getBalance
- https://eth-converter.com

## Initialize project
- npm init
- npm install --save-dev hardhat
- npx hardhat
    - Create hardhat project
- mkdir contracts
    - where we’ll keep our NFT smart contract code
- mkdir scripts
    - where we’ll keep scripts to deploy and interact with our smart contract

## Contract
- [OpenZeppelin](https://docs.openzeppelin.com/contracts/3.x/erc721) implementation of ERC-721
- npm install --save @openzeppelin/contracts
- MyNFT.sol in `contracts` folder

## Configuration
- npm install dotenv --save
- New .env file
- Install Ether.js
    - Ethers.js is a library that makes it easier to interact and make requests to Ethereum by wrapping standard JSON-RPC methods with more user friendly methods.
- npm install --save-dev @nomiclabs/hardhat-ethers ethers@^5.0.0
- Update hardhat.config.js with network configuration
- npx hardhat compile
    - Compile contract

## Deploy
- deploy.js in `scripts` folder
- npx hardhat --network mumbai run scripts/deploy.js
    - Contract deployed to address: 0x4FA8AE139dBd70B5BA8201328Cb123DD49DC784f
    - This must be saved for later

# NFT minting
“Minting an NFT” is the act of publishing a unique instance of your ERC-721 token on the blockchain.

- npm install --save @alch/alchemy-web3
    - Install web3, a library used to make creating requests to the Ethereum blockchain easier (like ether.js)
- mint-nft.js in `scripts` directory
- Get compiled contract ABI (Application Binary Interface) from `artifacts/contracts/MyNFT.sol/MyNFT.json` using web3
- node scripts/mint-nft.js
    - Just for printing abi
- Need to configure metadata using IPFS in order to ensure the NFT is decentralized
    - Interplanetary File System (IPFS) is a decentralized protocol and peer-to-peer network for storing and sharing data in a distributed file system.
- Use Pinata
- Upload an image to Pinata (will be the image for NFT)
- Create metadata json file nft-metadata.json
- Create an instance of contract using the previously saved address and ABI
    - 0x4FA8AE139dBd70B5BA8201328Cb123DD49DC784f
- Add Public key to .env to get account nonce
    - The nonce specification is used to keep track of the number of transactions sent from your address — which we need for security purposes and to prevent replay attacks. To get the number of transactions sent from your address, we use getTransactionCount.
- Create transaction updating mint-nft.js
    - Need to estimate gas (https://www.0xdev.co/how-to-compute-the-gas-fee-for-a-transaction-web3/)
    - Transaction must be signed with private key using web3.eth.sendSignedTransaction
- Get the metadata CID from Pinata and pass to mintNFT function
    - https://gateway.pinata.cloud/ipfs/<CID>
    - Set in .env
- node scripts/mint-nft.js
    - The hash of your transaction is:  0xf5ef32270ab8abeb23b5b30785675e3d6559792d8ef98a1cfdb8504dc7c54c92 
    - Check Alchemy's Mempool to view the status of your transaction!