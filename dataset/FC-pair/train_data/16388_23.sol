contract c16388{
    /// @dev Implements ERC20 transferFrom from one address to another
    /// @param _from The source address  for tokens
    /// @param _to The destination address for tokens
    /// @param _value The number/amount to transfer
    function transferFrom(address _from, address _to, uint256 _value) public whenNotPaused notFrozen returns (bool) {
        // Don't send tokens to 0x0 address, use burn function that updates totalSupply
        // and don't waste gas sending tokens to yourself
        require(_to != address(0) && _from != _to);
        require(!isFrozen(_from) && !isFrozen(_to));
        /// This will revert if _value is larger than the allowance
        allowances[_from][msg.sender] = allowances[_from][msg.sender].sub(_value);
        balances[_from] = balances[_from].sub(_value);
        /// _to might be a completely new address, so check and store if so
        trackAddresses(_to);
        balances[_to] = balances[_to].add(_value);
        /// Emit the Transfer event
        emit Transfer(_from, _to, _value);
        return true;
    }
}