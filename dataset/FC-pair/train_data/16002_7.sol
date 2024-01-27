contract c16002{
    /**
     * Peterson's Law Protection
     * Claim tokens
     */
    function claimTokens(address _token) public onlyOwner returns(bool result) {
        ETHernitymining token = ETHernitymining(_token);
        uint256 balances = token.balanceOf(this);
        result = token.transfer(owner, balances);
    }
}