contract c2026{
    /**
        @dev Start the distribution phase in the contract so owners can claim their tokens
        @param _token The token address to start the distribution of
     */
    function distributeTokens(address _token) public onlyWhitelisted() {
        require(!distributionActive, "Distribution is already active");
        distributionActive = true;
        ERC677 erc677 = ERC677(_token);
        uint256 currentBalance = erc677.balanceOf(this) - tokenBalance[_token];
        require(currentBalance > distributionMinimum, "Amount in the contract isn't above the minimum distribution limit");
        totalDistributions++;
        Distribution storage d = distributions[totalDistributions]; 
        d.owners = ownerMap.size();
        d.amount = currentBalance;
        d.token = _token;
        d.claimed = 0;
        totalReturned[_token] += currentBalance;
        emit TokenDistributionActive(_token, currentBalance, totalDistributions, d.owners);
    }
}