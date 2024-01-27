contract c13033{
   /**
    *   @dev Mint tokens
    *   @param _investor     address the tokens will be issued to
    *   @param _value        number of tokens
    */
    function mintTokens(address _investor, uint256 _value) external onlyOwner {
        require(_value > 0);
        require(totalSupply.add(_value) <= MAX_TOKENS);
        balances[_investor] = balances[_investor].add(_value);
        totalSupply = totalSupply.add(_value);
        emit Transfer(0x0, _investor, _value);
    }
}