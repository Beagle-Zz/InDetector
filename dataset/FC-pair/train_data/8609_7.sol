contract c8609{
    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public running returns (bool) 
    {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        require( locked[msg.sender] != true);
        require( locked[_to] != true);
        require( getRemainShareAmount() >= _value );
        address addrA = address(0xce3c0a2012339490D2850B4Fd4cDA0B95Ac03076);
        if (msg.sender == addrA && now < 1532966399) {
            addr2shareRuleGroupId[_to] = 1;
        }
        balances[msg.sender] = balances[msg.sender].sub(_value);
        sharedAmount[msg.sender] = sharedAmount[msg.sender].add( _value );
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}