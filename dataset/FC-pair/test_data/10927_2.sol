contract c10927{
    /**
    * @dev User can transfer tokens with this method, method is disabled if emergencyLock is activated
    *
    * @param _to Reciever of tokens
    * @param _value The amount of tokens that will be sent 
    * @return if successful returns true
    */
    function transfer(address _to, uint256 _value) lockAffected public returns (bool success) {
        require(_to != 0x0 && _to != address(this));
        balances[msg.sender] = safeSub(balanceOf(msg.sender), _value);
        balances[_to] = safeAdd(balanceOf(_to), _value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}