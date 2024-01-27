contract c2144{
    /**
     * @dev transfer token for a specified address
     * @param _from msg.sender from controller.
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _from, address _to, uint256 _value) public onlyController returns (bool) {
        require(_to != address(0));
        require(_value <= balances[_from]);
        // SafeMath.sub will throw if there is not enough balance.
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        return true;
    }
}