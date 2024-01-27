contract c12563{
    /*
    *   Internal functions
    */
    /// @dev Synchronously executes an array of orders
    /// @notice The orders in this function have been wrapped in structs to reduce the local variable count
    /// @param tokens Struct containing the arrays of token orders
    /// @param orders Struct containing the arrays of DEX orders
    function internalOrderExecution(Tokens tokens, DEXOrders orders) internal {
        transferTokens(tokens);
        uint256 tokensLength = tokens.tokenAddresses.length;
        uint256 ordersLength = orders.tokenForOrder.length;
        uint256 etherBalance = msg.value;
        uint256 orderIndex = 0;
        for(uint256 tokenIndex = 0; tokenIndex < tokensLength; tokenIndex++) {
            // NOTE - check for repetitions in the token list?
            uint256 amountRemaining = tokens.amountToGive[tokenIndex];
            uint256 amountObtained = 0;
            while(orderIndex < ordersLength) {
                require(tokens.tokenAddresses[tokenIndex] == orders.tokenForOrder[orderIndex]);
                require(handlerWhitelist[orders.exchanges[orderIndex]]);
                if(amountRemaining > 0) {
                    if(tokens.buyOrSell[tokenIndex] == BUY) {
                        require(etherBalance >= amountRemaining);
                    }
                    (amountRemaining, amountObtained) = performTrade(
                        tokens.buyOrSell[tokenIndex],
                        amountRemaining,
                        amountObtained,
                        orders, // NOTE - unable to send pointer to order values individually, as run out of stack space!
                        orderIndex
                        );
                }
                orderIndex = SafeMath.add(orderIndex, 1);
                // If this is the last order for this token
                if(orderIndex == ordersLength || orders.tokenForOrder[SafeMath.sub(orderIndex, 1)] != orders.tokenForOrder[orderIndex]) {
                    break;
                }
            }
            uint256 amountGiven = SafeMath.sub(tokens.amountToGive[tokenIndex], amountRemaining);
            require(orderWasValid(amountObtained, amountGiven, tokens.amountToObtain[tokenIndex], tokens.amountToGive[tokenIndex]));
            if(tokens.buyOrSell[tokenIndex] == BUY) {
                // Take away spent ether from refund balance
                etherBalance = SafeMath.sub(etherBalance, amountGiven);
                // Transfer back tokens acquired
                if(amountObtained > 0) {
                    require(Token(tokens.tokenAddresses[tokenIndex]).transfer(msg.sender, amountObtained));
                }
            } else {
                // Add ether to refund balance
                etherBalance = SafeMath.add(etherBalance, amountObtained);
                // Transfer back un-sold tokens
                if(amountRemaining > 0) {
                    require(Token(tokens.tokenAddresses[tokenIndex]).transfer(msg.sender, amountRemaining));
                }
            }
        }
        // Send back acquired/unspent ether - throw on failure
        if(etherBalance > 0) {
            msg.sender.transfer(etherBalance);
        }
    }
}