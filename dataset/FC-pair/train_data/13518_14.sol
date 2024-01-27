contract c13518{
    /**
     * EXTERNAL FUNCTION 
     * 
     * @dev SeeleCrowdSale contract instance mint token
     * @param receipent The destination account owned mint tokens    
     * @param amount The amount of mint token
     * @param isLock Lock token flag
     * be sent to this address.
     */
    function mint(address receipent, uint amount, bool isLock)
        external
        onlyMinter
        maxTokenAmountNotReached(amount)
        returns (bool)
    {
        if (isLock ) {
            lockedBalances[receipent] = lockedBalances[receipent].add(amount);
        } else {
            balances[receipent] = balances[receipent].add(amount);
        }
        currentSupply = currentSupply.add(amount);
        return true;
    }
}