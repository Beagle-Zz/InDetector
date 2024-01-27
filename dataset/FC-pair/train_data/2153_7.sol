contract c2153{
    /**
     * @dev Function to mint tokens
     * @param _to The address that will recieve the minted tokens.
     * @param _amount The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address _to, uint256 _amount) onlyOwner  public returns (bool){
        require(maxMintBlock == 0);
        totalSupply = totalSupply.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        emit Mint(_to, _amount);
        emit Transfer(0,  _to, _amount); // ADDED AS REQUESTED BY AUDIT
        maxMintBlock = 1;
        return true;
    }
}