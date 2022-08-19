# Setup

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

# Initialize project
- npm init
- npm install --save-dev hardhat
- npx hardhat
    - Create hardhat project
- mkdir contracts
    - where we’ll keep our NFT smart contract code
- mkdir scripts
    - where we’ll keep scripts to deploy and interact with our smart contract

# Contract
- [OpenZeppelin](https://docs.openzeppelin.com/contracts/3.x/erc721) implementation of ERC-721
- npm install --save @openzeppelin/contracts
- MyNFT.sol in `contracts` folder

# Configuration
- npm install dotenv --save
- New .env file