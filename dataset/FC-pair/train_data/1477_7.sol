contract c1477{
    /**
     * @dev Function to mint tokens
     * @param _to The address that will receive the minted tokens.
     * @param _amount The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
        totalSupply += _amount;
        balances[_to] += _amount;
        Mint(_to, _amount);
        Transfer(address(0), _to, _amount);
        return true;
    }
}