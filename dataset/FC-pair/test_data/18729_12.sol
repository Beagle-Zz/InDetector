contract c18729{
      /**
     * @dev Function to mint tokens
     * @param _to The address that will receive the minted tokens.
     * @param _amount The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address _to, uint _amount, bool freeze) canMint onlyMinter external returns (bool) {
        totalSupply = totalSupply.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        if (freeze) {
            freezedList[_to] = true;
        }
        Mint(_to, _amount);
        Transfer(address(0), _to, _amount);
        return true;
    }
}