contract c4957{
   /**
    *   @return true if the transfer was successful
    */
    function transfer(address _to, uint256 _amount) public returns(bool) {
        require(_amount > 0);
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_to] = balances[_to].add(_amount);
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
}