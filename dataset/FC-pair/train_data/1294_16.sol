contract c1294{
    /**
    * @dev Function to return granted token to the initial sender.
    * @param _amount - A uint256 specifying the amount of tokens to be returned.
    */
    function returnGrantedToken(uint256 _amount)
        public
        returns (bool success)
    {
        address to = timeLocks[msg.sender].from;
        require(to != address(0));
        require(_amount > 0, "Nothing to transfer.");
        require(timeLocks[msg.sender].amount > 0, "Nothing to return.");
        require(_amount <= timeLocks[msg.sender].amount.sub(timeLocks[msg.sender].vestedAmount), "Not enough granted token to return.");
        timeLocks[msg.sender].amount = timeLocks[msg.sender].amount.sub(_amount);
        balances[to] = balances[to].add(_amount);
        emit GrantedTokenReturned(msg.sender, to, _amount);
        return true;
    }
}