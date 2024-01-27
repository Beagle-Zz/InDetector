contract c8498{
    // ------------------------------------------------------------------------
    // Dispense some free tokens. The more gas you spend, the more tokens you
    // recieve. 
    // 
    // Tokens recieved (in satoshi) = gasprice / priceInWeiPerSatoshi
    // ------------------------------------------------------------------------
    function dispense(address destination) public {
        uint256 sendAmount = calculateDispensedTokensForGasPrice(tx.gasprice);
        require(tokenBalance() > sendAmount);
        ERC20Interface(faucetTokenAddress).transfer(destination, sendAmount);
        emit Dispense(destination, sendAmount);
    }
}