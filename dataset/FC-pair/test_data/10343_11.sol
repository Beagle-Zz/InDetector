contract c10343{
    /**
     * @dev Overrides function to mint tokens from `MintableToken` contract with new modifier
     * @param _to The address that will receive the minted tokens.
     * @param _amount The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
    */
    function mint(address _to, uint256 _amount) isOwnerOrAdditionalOwner canMint maximumSupplyWasNotReached(_amount) public returns (bool) {
        totalSupply = totalSupply.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        Mint(_to, _amount);
        Transfer(0x0, _to, _amount);
        return true;
    }
}