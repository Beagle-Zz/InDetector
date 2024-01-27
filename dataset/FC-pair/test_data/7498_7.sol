contract c7498{
    /**
     * @dev Transfer tokens from one address to another
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amout of tokens to be transfered
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool)     
    {
       if (_value == 0) 
       {
           emit Transfer(_from, _to, _value);  // Follow the spec to launch the event when value is equal to 0
           return;
       }
       require(_to != address(0x0));
       require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value >= 0);
       balances[_from] = balances[_from].sub(_value);
       allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
       balances[_to] = balances[_to].add(_value);
       emit Transfer(_from, _to, _value);
       return true;
    }
}