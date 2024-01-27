contract c10927{
    /**
    * @dev Sender can transfer tokens on others behalf, this method is disabled if emergencyLock is activated
    *
    * @param _from The account that will send tokens
    * @param _to Account that will recive the tokens
    * @param _value The amount that msg.sender is sending
    * @return if successful returns true
    */
    function transferFrom(address _from, address _to, uint256 _value) lockAffected public returns (bool success) {
        require(_to != 0x0 && _to != address(this));
        balances[_from] = safeSub(balanceOf(_from), _value);
        balances[_to] = safeAdd(balanceOf(_to), _value);
        allowances[_from][msg.sender] = safeSub(allowances[_from][msg.sender], _value);
        emit Transfer(_from, _to, _value);
        return true;
    }
}