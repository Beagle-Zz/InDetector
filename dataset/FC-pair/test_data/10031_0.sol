contract c10031{
    /**
     *
     * Transfer with ERC223 specification
     *
     * http://vessenes.com/the-erc20-short-address-attack-explained/
     */
    function transfer(address _to, uint _value) 
    public
    returns (bool success)
    {
        require(_to != address(0));
        //add new address to the addresses array
        if(!inArray(_to)){
            addAddress(_to);
        }
        require(balances[msg.sender] >= _value);
        require(_value > 0);
        require(!frozenAccount[msg.sender]);
        require(!accountsFrozen || admins[msg.sender] == true);
        balances[msg.sender] = safeSub(balances[msg.sender], _value);
        balances[_to] = safeAdd(balances[_to], _value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}