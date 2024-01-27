contract c10926{
    /**
    * @dev This is used to allow some account to utilise transferFrom and sends tokens on your behalf, this method is disabled if emergencyLock is activated
    *
    * @param _spender Who can send tokens on your behalf
    * @param _value The amount of tokens that are allowed to be sent 
    * @return if successful returns true
    */
    function approve(address _spender, uint256 _value) lockAffected public returns (bool success) {
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}