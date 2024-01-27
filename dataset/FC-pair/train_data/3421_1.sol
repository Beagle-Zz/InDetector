contract c3421{
    // PUBLIC METHODS
    /**
     * @notice Send `_value` tokens to `_to` from `msg.sender`
     * @dev Transfers sender's tokens to a given address
     * @dev Similar to transfer(address, uint, bytes), but without _data parameter
     * @param _to Address of token receiver
     * @param _value Number of tokens to transfer
     * @return Returns success of function call
     */
    function transfer(address _to, uint _value)
        public
        returns (bool success)
    {
        require(balances[msg.sender] >= _value); // sanity checks
        require(balances[_to] + _value >= balances[_to]);
        balances[msg.sender] = sub(balances[msg.sender], _value);
        balances[_to] = add(balances[_to], _value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}