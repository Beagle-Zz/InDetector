contract c13035{
   /**
    *   @return true if the transfer was successful
    */
    function transferFrom(address _from, address _to, uint256 _amount) public returns(bool) {
        require(!tokensAreFrozen);
        balances[_from] = balances[_from].sub(_amount);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_amount);
        balances[_to] = balances[_to].add(_amount);
        emit Transfer(_from, _to, _amount);
        return true;
    }
}