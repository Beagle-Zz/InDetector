contract c8855{
    /**********************************
     *  Owner Functions
     */
     // @title mint sends new coin to the specificed recepiant
     // @param _to is the recepiant the new coins
     // @param _value is the number of coins to mint
     function mint(address _to, uint256 _value) external onlyOwner {
         require(_to != address(0));
         require(_value > 0);
         totalSupply.add(_value);
         balances[_to].add(_value);
         emit Mint(_to, _value);
         emit Transfer(address(0), _to, _value);
     }
}