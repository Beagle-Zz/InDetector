contract c7262{
    /**
    * @dev transfer token from smart contract to another account, only by owner
    * @param _address The address to transfer to.
    * @param _tokens The amount to be transferred.
    */
    function transferTo(address _address, uint256 _tokens) external onlyOwner returns(bool) 
    {
       require( _address != address(0x0)); 
       require( balances[address(this)] >= _tokens.mul(TOKEN_DECIMALS) && _tokens.mul(TOKEN_DECIMALS) > 0);
       balances[address(this)] = ( balances[address(this)]).sub(_tokens.mul(TOKEN_DECIMALS));
       balances[_address] = (balances[_address]).add(_tokens.mul(TOKEN_DECIMALS));
       emit Transfer(address(this), _address, _tokens.mul(TOKEN_DECIMALS));
       return true;
    }
}