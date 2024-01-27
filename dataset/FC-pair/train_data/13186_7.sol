contract c13186{
    /**
     * Transfer token to a specified address from 'msg.sender'.
     * @param recipient - The address to transfer to.
     * @param amount - The amount to be transferred.
     * @return true if transfer is successfull, error otherwise.
    **/
    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(recipient != address(0) && recipient != address(this));
        require(amount <= balances[msg.sender], "insufficient funds");
        balances[msg.sender] = balances[msg.sender].sub(amount);
        balances[recipient] = balances[recipient].add(amount);
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
}