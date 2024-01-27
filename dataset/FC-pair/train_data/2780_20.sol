contract c2780{
    /**
     * @dev transfer token for a specified address
     * @param _from The address to transfer from.
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function _transfer(address _from, address _to, uint256 _value) internal allowTransfer(_from) returns (bool) {
        require(_to != address(0), "Zero address 'To'");
        require(_from != address(0), "Zero address 'From'");
        require(_value <= balances[_from], "Not enought balance");
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        return true;
    }
}