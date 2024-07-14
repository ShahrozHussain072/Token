Token Marketplace Contract Documentation

This project involves the development of a decentralized token marketplace using Ethereum smart contracts. The main components of the project include the creation of a custom ERC20 token (MYU) and a corresponding marketplace (MYUMarketplace). The ERC20 token adheres to the OpenZeppelin standard, providing functionalities such as minting, burning, pausing transfers, and ownership management. The marketplace contract allows users to buy and sell MYU tokens using Ether.

Features:
ERC20 Token (MYU):

Name: MYUTH
Symbol: MYU
Functionalities:
Minting tokens to specified addresses.
Burning tokens from specific addresses.
Pausing and unpausing token transfers.
Transfer and allowance management.
Token Marketplace (MYUMarketplace):

Initialization: Requires the address of the deployed MYU token contract, along with initial buy and sell prices in Wei.
Operations:
Buy Tokens: Users can purchase MYU tokens by sending Ether to the marketplace contract. The amount of tokens received is calculated based on the current buy price.
Sell Tokens: Users can sell MYU tokens back to the marketplace contract in exchange for Ether. The amount of Ether received is determined by the current sell price.
Price Adjustment: The owner can adjust the buy and sell prices dynamically using functions provided in the contract.
Withdrawal: The contract owner can withdraw Ether from the contract.
Usage:
Deployment:

Deploy the MYU token contract first, obtaining its contract address.
Deploy the MYUMarketplace contract, providing the MYU token contract address, initial buy price, and initial sell price.
Interacting with MYUMarketplace:

Buying Tokens: Users send Ether to the MYUMarketplace contract address using the buyTokens function to acquire MYU tokens.
Selling Tokens: Users approve the MYUMarketplace contract to spend their MYU tokens and then call the sellTokens function to exchange tokens for Ether.
Price Management: The owner can manage prices by calling setBuyPrice and setSellPrice functions to adjust the token prices based on market conditions.
Withdrawal: The contract owner can withdraw accumulated Ether using the withdraw function.
This project aims to provide a secure and decentralized platform for trading MYU tokens, leveraging Ethereum's blockchain capabilities to ensure transparency and reliability in token transactions.