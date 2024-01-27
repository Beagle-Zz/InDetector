contract c4717{
    /**
     * @dev Perform the initial token distribution according to the Drone Madness crowdsale rules
     * @param _teamAddress address address for the team tokens
     * @param _prizePoolAddress address address for the prize pool
     * @param _reservePoolAdddress address address for the reserve pool
     */
    function doInitialDistribution(
        address _teamAddress,
        address _prizePoolAddress,
        address _reservePoolAdddress) external onlyOwner {
        // Create locks for team and reserve pools        
        teamWallet = new TokenTimelock(token, _teamAddress, closingTime.add(TEAM_LOCK_TIME));
        reservePool = new TokenTimelock(token, _reservePoolAdddress, closingTime.add(RESERVE_LOCK_TIME));
        // Perform initial distribution
        uint256 tokenCap = CappedToken(token).cap();
        // Create airdrop and advisor pools
        advisorPool = new TokenPool(token, tokenCap.mul(ADVISOR_TOKENS).div(100));
        airdropPool = new TokenPool(token, tokenCap.mul(AIRDROP_TOKENS).div(100));
        // Distribute tokens to pools
        MintableToken(token).mint(teamWallet, tokenCap.mul(TEAM_TOKENS).div(100));
        MintableToken(token).mint(_prizePoolAddress, tokenCap.mul(PRIZE_TOKENS).div(100));
        MintableToken(token).mint(advisorPool, tokenCap.mul(ADVISOR_TOKENS).div(100));
        MintableToken(token).mint(airdropPool, tokenCap.mul(AIRDROP_TOKENS).div(100));
        MintableToken(token).mint(reservePool, tokenCap.mul(RESERVE_TOKENS).div(100));
        // Ensure that only sale tokens left
        assert(tokenCap.sub(token.totalSupply()) == tokenCap.mul(SALE_TOKENS).div(100));
    }
}