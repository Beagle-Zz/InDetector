contract c2755{
    /**
     * @dev Allows another contract to spend tokens on behalf of the `_from` address and send them to the `_to` address.
     *
     * @param _from The address which approved you to spend tokens on their behalf.
     * @param _to The address where you want to send tokens.
     * @param _value The number of tokens to be sent.
     *
     * @return Whether the transfer was successful or not.
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_value <= allowed[_from][msg.sender]);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].minus(_value);
        executeTransfer(_from, _to, _value);
        return true;
    }
}