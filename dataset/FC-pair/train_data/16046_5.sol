contract c16046{
    /**
    * Allows for the transfer of tokens on the behalf of the owner given that the owner has
    * allowed it previously. 
    *
    * @param _from The address of the owner
    * @param _to The address of the recipient 
    * @param _value The amount of tokens to be sent
    **/
    function transferFrom(address _from, address _to, uint256 _value) public  returns (bool) {
        require(allowances[_from][msg.sender] >= _value && _to != 0x0 && balances[_from] >= _value && _value > 0);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowances[_from][msg.sender] = allowances[_from][msg.sender].sub(_value);
        Transfer(_from, _to, _value);
        return true;
    }
}