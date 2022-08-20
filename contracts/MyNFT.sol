//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * Imports ERC721 Openzeppelin class which already implements functions from
 * ERC-721 standard needed for NFT.
 */
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
/**
 * @openzeppelin/contracts/utils/Counters.sol provides counters that can only be
 * incremented or decremented by one. Our smart contract uses a counter to keep track
 * of the total number of NFTs minted and set the unique ID on our new NFT.
 * (Each NFT minted using a smart contract must be assigned a unique ID—here our unique
 * ID is just determined by the total number of NFTs in existence.
 */
import "@openzeppelin/contracts/utils/Counters.sol";
/**
 * Sets up access control on our smart contract, so only the owner of the
 * smart contract (you) can mint NFTs. (Note, including access control is entirely
 * a preference. If you'd like anyone to be able to mint an NFT using your smart
 * contract, remove the word Ownable on line 10 and onlyOwner on line 17.)
 */
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    string constant TOKEN_NAME = "MyNFT";
    string constant TOKEN_SYMBOL = "NFT";

    constructor() ERC721(TOKEN_NAME, TOKEN_SYMBOL) {}

    function mintNFT(address recipient, string memory tokenURI)
        public
        onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
