async function main() {

    /**
     * A ContractFactory in ethers.js is an abstraction used to deploy
     * new smart contracts, so MyNFT here is a factory for instances of our NFT contract. 
     * When using the hardhat-ethers plugin ContractFactory and Contract instances are
     * connected to the first signer by default.
     */
    const MyNFT = await ethers.getContractFactory("MyNFT")

    /**
     * Calling deploy() on a ContractFactory will start the deployment, and return
     * a Promise that resolves to a Contract. This is the object that has a method for 
     * each of our smart contract functions.
     */
    const myNFT = await MyNFT.deploy()
    await myNFT.deployed()
    console.log("Contract deployed to address:", myNFT.address)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })
