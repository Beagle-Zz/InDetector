contract c8629{
    /**
     * @dev Mints tokens to a beneficiary address. Capped by TOTAL_TOKENS.
     * @param _to Who got the tokens.
     * @param _amount Amount of tokens.
     */
    function mint(address _to, uint256 _amount) onlyOwner canMint public returns(bool) {
        require(totalSupply_.add(_amount) <= TOTAL_TOKENS);
        return super.mint(_to, _amount);
    }
}