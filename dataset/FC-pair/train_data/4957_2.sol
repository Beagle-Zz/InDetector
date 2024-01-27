contract c4957{
   /**
    *   @dev Burn Tokens
    *   @param _value        number of tokens to burn
    */
    function burnTokens(uint256 _value) external  {
        require(balances[msg.sender] > 0);
        require(_value > 0);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        totalSupply = totalSupply.sub(_value);
        emit Burn(msg.sender, _value);
    }
}