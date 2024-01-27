contract c10442{
    // This function is called by both transfer and transferFrom
    function transferBasic(address _from, address _to, uint256 _value) internal {
        uint256 tokensOwedSender = 0;
        uint256 tokensOwedReceiver = 0;
        uint256 balSender = balanceOfBasic(_from);
        // Distribute rewards tokens first
        if (!rewardGenerationComplete) {
            tokensOwedSender = tokensOwed(_from);
            require(_value <= (balSender.add(tokensOwedSender))); // Sender should have the number of tokens they want to send
            tokensOwedReceiver = tokensOwed(_to);
            // If there were tokens owed, increase total supply accordingly
            if ((tokensOwedSender.add(tokensOwedReceiver)) > 0) {
                increaseTotalSupply(tokensOwedSender.add(tokensOwedReceiver)); // This will break if total exceeds max cap
                pendingRewardsToMint = pendingRewardsToMint.sub(tokensOwedSender.add(tokensOwedReceiver));
            }
            // If there were tokens owed, raise mint events for them
            raiseEventIfMinted(_from, tokensOwedSender);
            raiseEventIfMinted(_to, tokensOwedReceiver);
        } else {
            require(_value <= balSender);
        }
        // Update balances of sender and receiver
        accounts[_from].balance = (balSender.add(tokensOwedSender)).sub(_value);
        accounts[_to].balance = (accounts[_to].balance.add(tokensOwedReceiver)).add(_value);
        // Update last intervals for sender and receiver
        uint256 currInt = intervalAtTime(now);
        accounts[_from].lastInterval = currInt;
        accounts[_to].lastInterval = currInt;
        emit Transfer(_from, _to, _value);
    }
}