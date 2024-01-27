contract c4769{
    /* Non-ERC Functions */
    /* Remove the specified amount of the tokens from the supply permanently */
    function burn(uint256 _value, bytes _data) returns (bool success) {
        if (balances[msg.sender] >= _value
            && _value > 0) {
            balances[msg.sender] -= _value;
            _currentSupply -= _value;
            Burn(msg.sender, _value, _currentSupply, _data);
            return true;
        } else {
            return false;
        }
    }
}