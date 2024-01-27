contract c13293{
    /**
    * @dev Complete pre-allocations to team, promotions and reserve pool
    */
    function doPreAllocations() external onlyOwner returns (bool) {
        require(preAllocationsPending);
        //Allocate promo tokens immediately
        token.transfer(_promo, PROMO_TOKEN_AMOUNT);
        //Allocate team tokens _team account through internal method
        //_allocateTokens(_team, TEAM_TOKEN_AMOUNT);
        _allocateTokens(_founder_one, TEAM_TOKEN_AMOUNT);
        _allocateTokens(_founder_two, TEAM_TOKEN_AMOUNT);
        //Allocate reserved tokens to _reserve account through internal method
        _allocateTokens(_reserve, RESERVE_TOKEN_AMOUNT);
        totalAllocated = totalAllocated.add(PROMO_TOKEN_AMOUNT);
        preAllocationsPending = false;
        return true;
    }
}