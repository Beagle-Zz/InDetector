contract c7245{
    /**
     * @notice Send `_value` tokens to `_to` on behalf of `_from`
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(checkVestingCondition(_from));
        require (_value <= approved[_from][msg.sender]);     // Check allowance
        approved[_from][msg.sender] = approved[_from][msg.sender].minus(_value);
        _transfer(_from, _to, _value);
        return true;
    }
}