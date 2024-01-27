contract c2012{
    /**
        @dev Withdraw tokens from your contract balance
        @param _token The token address for token claiming
        @param _amount The amount of tokens to withdraw
     */
    function withdrawTokens(address _token, uint256 _amount) public {
        require(_amount > 0, "You have requested for 0 tokens to be withdrawn");
        Owner storage o = owners[msg.sender];
        Distribution storage d = distributions[totalDistributions]; 
        if (distributionActive && !d.claimedAddresses[msg.sender]) {
            claimTokens(msg.sender);
        }
        require(o.balance[_token] >= _amount, "Amount requested is higher than your balance");
        o.balance[_token] = o.balance[_token].sub(_amount);
        tokenBalance[_token] = tokenBalance[_token].sub(_amount);
        ERC677 erc677 = ERC677(_token);
        require(erc677.transfer(msg.sender, _amount) == true);
        emit TokenWithdrawal(_token, msg.sender, _amount);
    }
}