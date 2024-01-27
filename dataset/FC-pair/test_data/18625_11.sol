contract c18625{
    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= freeBalances[msg.sender]);
        // SafeMath.sub will throw if there is not enough balance.
        freeBalances[msg.sender] = freeBalances[msg.sender].sub(_value);
        freeBalances[_to] = freeBalances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }
}