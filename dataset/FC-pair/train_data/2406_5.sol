contract c2406{
    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        // solium-disable-next-line security/no-block-members
        require(freezedAccounts[msg.sender] == 0 || freezedAccounts[msg.sender] < block.timestamp);
        // solium-disable-next-line security/no-block-members
        require(freezedAccounts[_to] == 0 || freezedAccounts[_to] < block.timestamp);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}