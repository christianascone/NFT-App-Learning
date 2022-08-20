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

# NFT minting
“Minting an NFT” is the act of publishing a unique instance of your ERC-721 token on the blockchain.

- npm install --save @alch/alchemy-web3
    - Install web3, a library used to make creating requests to the Ethereum blockchain easier (like ether.js)
- mint-nft.js in `scripts` directory