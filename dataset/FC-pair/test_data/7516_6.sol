contract c7516{
    /**
     * Transfers tokens from the sender's wallet to the specified `_to` wallet.
     * @param _to Address of the transfer's recipient.
     * @param _value Number of tokens to transfer.
     * @return True if the transfer succeeded.
     */
    function transfer(address _to, uint _value) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }
}