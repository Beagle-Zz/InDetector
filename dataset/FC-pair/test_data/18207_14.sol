contract c18207{
    /**
     * @dev Mint Token
     * @param receipent address owning mint tokens    
     * @param amount amount of token
     */
    function mintToken(address receipent, uint amount)
        external
        onlyMinter
        maxDmlTokenAmountNotReached(amount)
        returns (bool)
    {
        require(now <= endTime);
      	lockedBalances[receipent] = lockedBalances[receipent].add(amount);
      	totalSupply = totalSupply.add(amount);
      	return true;
    }
}