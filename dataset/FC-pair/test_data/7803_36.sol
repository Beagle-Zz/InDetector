contract c7803{
    //Overrides parent by storing balances instead of issuing tokens right away.
    // @param _beneficiary Token purchaser
    // @param _tokenAmount Amount of tokens purchased
    function _processPurchase(address _beneficiary, uint256 _tokenAmount) internal {
        uint256 newTokensSold = tokensStillInLockup.add(_tokenAmount);
        require(newTokensSold <= token.balanceOf(address(this)));
        tokensStillInLockup = newTokensSold;
        //add tokens to contract token balance (due to lock-up)
        balances[_beneficiary] = balances[_beneficiary].add(_tokenAmount);
    }
}