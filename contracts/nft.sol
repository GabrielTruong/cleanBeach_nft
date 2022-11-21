//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract tiketEvent is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    string[]  tokensURI = ["https://gateway.pinata.cloud/ipfs/QmYePTroBp1dCKTegZXoBjNC5dquXGwEP7revxXX8qD8oW",
    "https://gateway.pinata.cloud/ipfs/Qmf9qkSaqr3pK2uQMjLdyaLsC7bqcKTs5DUou2XGgrJJSW",
    "https://gateway.pinata.cloud/ipfs/QmX9H4VbVbN3igvR3yEYbcUa2XqSditPuDSYp7SnCRFVyD",
    "https://gateway.pinata.cloud/ipfs/QmNiucByQrGLzvHpuPkxb1fmucSXscHhriuf1YSh89Kre5",
    "https://gateway.pinata.cloud/ipfs/QmZXNRcFwCD2xqHZYqpQTpchbFjXWs3zfjDTa2f6prCxZG",
    "https://gateway.pinata.cloud/ipfs/QmRgLKA2nAQHKesfHbUVyLccmu8TML4KEgAmmpPUZpWDrc"];

    constructor(address recipient) ERC721("ticket event", "TE") {    
        _tokenIds.increment();

        uint256 newItemId = 1;
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokensURI[0]);

    }

    function changeImage() public payable {
        uint256 nft_balance = address(this).balance + msg.value;
        if (nft_balance > 0.01 ether){
        _setTokenURI(1, tokensURI[1]);    
        } 
        if (nft_balance > 0.02 ether){
        _setTokenURI(1, tokensURI[2]);    
        } 
        if (nft_balance > 0.03 ether){
        _setTokenURI(1, tokensURI[3]);    
        }
        if (nft_balance > 0.4 ether){
        _setTokenURI(1, tokensURI[4]);    
        }
        if (nft_balance > 0.5 ether){
        _setTokenURI(1, tokensURI[5]);    
        }

        
    }

    receive() external payable {
        changeImage();
    }

    function drawBack() public onlyOwner {
    (bool sent, bytes memory data) = msg.sender.call{value: address(this).balance}("");
    require(sent, "Failed to send Ether");
    }




}