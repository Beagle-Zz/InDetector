contract c12070{
    /* Spender of tokens transfers tokens from the owner's balance */
    /* Must be pre-approved by owner */
    function transferFrom(address _from, address _to, uint256 _amount) public returns (bool) {
        require(_to != address(0x0));
        // Do not allow to transfer token to contract address to avoid tokens getting stuck
        require(isContract(_to) == false);
        // balance checks
        require(balances[_from] >= _amount);
        require(allowed[_from][msg.sender] >= _amount);
        // update balances and allowed amount
        balances[_from]            = balances[_from].sub(_amount);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_amount);
        balances[_to]              = balances[_to].add(_amount);
        // log event
        emit Transfer(_from, _to, _amount);
        return true;
    }
}