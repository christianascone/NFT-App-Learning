require("dotenv").config()
const API_URL = process.env.API_URL
const { createAlchemyWeb3 } = require("@alch/alchemy-web3")
const web3 = createAlchemyWeb3(API_URL)
// Get ABI from compiled contract
const contract = require("../artifacts/contracts/MyNFT.sol/MyNFT.json")
console.log(JSON.stringify(contract.abi))

const contractAddress = process.env.CONTRACT_ADDRESS
const nftContract = new web3.eth.Contract(contract.abi, contractAddress)