contract c12563{
    /// @dev Iterates through a list of token orders, transfer the SELL orders to this contract & calculates if we have the ether needed
    /// @param tokens Struct containing the arrays of token orders
    function transferTokens(Tokens tokens) internal {
        uint256 expectedEtherAvailable = msg.value;
        uint256 totalEtherNeeded = 0;
        for(uint256 i = 0; i < tokens.tokenAddresses.length; i++) {
            if(tokens.buyOrSell[i] == BUY) {
                totalEtherNeeded = SafeMath.add(totalEtherNeeded, tokens.amountToGive[i]);
            } else {
                expectedEtherAvailable = SafeMath.add(expectedEtherAvailable, tokens.amountToObtain[i]);
                require(TokenTransferProxy(tokenTransferProxy).transferFrom(
                    tokens.tokenAddresses[i],
                    msg.sender,
                    this,
                    tokens.amountToGive[i]
                ));
            }
        }
        // Make sure we have will have enough ETH after SELLs to cover our BUYs
        require(expectedEtherAvailable >= totalEtherNeeded);
    }
}