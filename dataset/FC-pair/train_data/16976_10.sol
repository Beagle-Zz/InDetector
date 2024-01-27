contract c16976{
    /// @notice distribute tokens to multiple addresses
    /// @param addresses to distribute to
    /// @param _value to distribute
    function distributeToken(address[] addresses, uint256 _value) onlyOwner public {
        require (balanceOf[owner] >= _value*addresses.length);                      // Check if the sender has enough
        for (uint i = 0; i < addresses.length; i++) {
            require (addresses[i] != 0x0);                                          // Prevent transfer to 0x0 address. Use burn() instead
            require (balanceOf[addresses[i]] + _value > balanceOf[addresses[i]]);   // Check for overflows
            require(!frozenAccount[owner]);                                         // Check if sender is frozen
            require(!frozenAccount[addresses[i]]);                                  // Check if recipient is frozen
            balanceOf[owner] -= _value;
            balanceOf[addresses[i]] += _value;
            Transfer(owner, addresses[i], _value);
        }
    }
}