contract c8710{
     /**
     @dev Destroy tokens
     *
     * Remove `_value` tokens from the system irreversibly
     *
     * @param _value the amount of money to burn
     */
    // solhint-disable-next-line
    function burn(uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);   // Check if the sender has enough
        balances[msg.sender] = balances[msg.sender].sub(_value);            // Subtract from the sender
        totalSupply_ = totalSupply_.sub(_value);                      // Updates totalSupply_
        emit Burn(msg.sender, _value);
        emit Transfer(msg.sender, 0x0, _value);
        return true;
    }
}