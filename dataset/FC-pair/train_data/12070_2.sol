contract c12070{
    /* Transfer the balance from owner's account to another account */
    function transfer(address _to, uint256 _amount) public returns (bool) {
        require(_to != address(0x0));
        // Do not allow to transfer token to contract address to avoid tokens getting stuck
        require(isContract(_to) == false);
        // amount sent cannot exceed balance
        require(balances[msg.sender] >= _amount);
        // update balances
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_to]        = balances[_to].add(_amount);
        // log event
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
}