contract c16388{
    /// @dev transfer token for a specified address
    /// @param _to The address to transfer to.
    /// @param _value The amount to be transferred.
    function transfer(address _to, uint256 _value) public whenNotPaused notFrozen returns (bool) {
        /// No transfers to 0x0 address, use burn instead, if implemented
        require(_to != address(0));
        /// No useless operations
        require(msg.sender != _to);
        /// This will revert if not enough funds
        balances[msg.sender] = balances[msg.sender].sub(_value);
        if (balances[msg.sender] == 0) {
            removeSeenAddress(msg.sender);
        }
        /// _to might be a completely new address, so check and store if so
        trackAddresses(_to);
        /// This will revert on overflow
        balances[_to] = balances[_to].add(_value);
        /// Emit the Transfer event
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}