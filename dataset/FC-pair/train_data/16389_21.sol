contract c16389{
    /// @dev bulkTransfer tokens to a list of specified addresses, not an ERC20 function
    /// @param _tos The list of addresses to transfer to.
    /// @param _values The list of amounts to be transferred.
    function bulkTransfer(address[] _tos, uint256[] _values) public whenNotPaused notFrozen ifAuthorized(msg.sender, BULKTRANSFER) returns (bool) {
        require (_tos.length == _values.length);
        uint256 sourceBalance = balances[msg.sender];
        /// Temporarily set balance to 0 to mitigate the possibility of re-entrancy attacks
        balances[msg.sender] = 0;
        for (uint256 i = 0; i < _tos.length; i++) {
            uint256 currentValue = _values[i];
            address _to = _tos[i];
            require(_to != address(0));
            require(currentValue <= sourceBalance);
            require(msg.sender != _to);
            sourceBalance = sourceBalance.sub(currentValue);
            balances[_to] = balances[_to].add(currentValue);
            trackAddresses(_to);
            emit Transfer(msg.sender, _tos[i], currentValue);
        }
        /// Set to the remaining balance
        balances[msg.sender] = sourceBalance;
        emit BulkTransfer(msg.sender, _tos.length);
        if (balances[msg.sender] == 0) {
            removeSeenAddress(msg.sender);
        }
        return true;
    }
}