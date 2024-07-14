// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./MYU.sol";

contract MYUMarketplace is Ownable {
    MYU public token;
    uint256 public buyPrice; 
    uint256 public sellPrice; 

    event Bought(uint256 amount);
    event Sold(uint256 amount);

    constructor(address tokenAddress, uint256 _buyPrice, uint256 _sellPrice) {
        token = MYU(tokenAddress);
        buyPrice = _buyPrice;
        sellPrice = _sellPrice;
    }

    function buyTokens() public payable {
        uint256 amountToBuy = msg.value / buyPrice;
        uint256 contractTokenBalance = token.balanceOf(address(this));
        require(contractTokenBalance >= amountToBuy, "Not enough tokens in the reserve");

        token.transfer(msg.sender, amountToBuy);
        emit Bought(amountToBuy);
    }

    function sellTokens(uint256 amount) public {
        require(token.balanceOf(msg.sender) >= amount, "You do not have enough tokens");
        uint256 etherAmount = amount * sellPrice;
        require(address(this).balance >= etherAmount, "Not enough Ether in the contract");

        token.transferFrom(msg.sender, address(this), amount);
        payable(msg.sender).transfer(etherAmount);
        emit Sold(amount);
    }

    function setBuyPrice(uint256 _buyPrice) public onlyOwner {
        buyPrice = _buyPrice;
    }

    function setSellPrice(uint256 _sellPrice) public onlyOwner {
        sellPrice = _sellPrice;
    }

    
    receive() external payable {}

    
    function withdraw(uint256 amount) public onlyOwner {
        payable(owner()).transfer(amount);
    }
}
