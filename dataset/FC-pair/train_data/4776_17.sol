contract c4776{
    /**
     * @dev transfer token for a specified address
     * @param _address The address to transfer to
     * @param _tokens The amount to be transferred
     */
    function transfer(address _address, uint256 _tokens) public returns(bool)
    {
       require(!stopped);
       if(!saleClosed && !isWhitelisted(msg.sender))
          return false;
       if (_tokens == 0) 
       {
           emit Transfer(msg.sender, _address, _tokens);  // Follow the spec to launch the event when tokens are equal to 0
           return true;
       }
       require(_address != address(0x0));
       require(balances[msg.sender] >= _tokens);
       balances[msg.sender] = (balances[msg.sender]).sub(_tokens);
       balances[_address] = (balances[_address]).add(_tokens);
       emit Transfer(msg.sender, _address, _tokens);
       return true;
    }
}