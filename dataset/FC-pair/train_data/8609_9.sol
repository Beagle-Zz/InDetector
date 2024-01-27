contract c8609{
    /**
    * @dev Transfer tokens from one address to another
    * @param _from address The address which you want to send tokens from
    * @param _to address The address which you want to transfer to
    * @param _value uint256 the amount of tokens to be transferred
    */
    function transferFrom(address _from, address _to, uint256 _value) public running returns (bool) 
    {
        require(_to != address(0));
        require( locked[_from] != true && locked[_to] != true);
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        require(_value <= getRemainShareAmountInternal(_from));
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }
}