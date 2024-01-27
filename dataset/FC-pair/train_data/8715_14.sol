contract c8715{
    /**
    * @dev Destroy tokens from other account
    *
    * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
    *
    * @param _from the address of the sender
    * @param _value the amount of money to burn
    */
    function burnFrom(address _from, uint256 _value)
    external
    returns(bool success) {
        require(_value <= _allowance[_from][msg.sender], "allowance too low");                           // Check allowance
        require(_value <= _balanceOf[_from], "balance too low");                                       // Is tehere enough coins on account
        _allowance[_from][msg.sender] = _allowance[_from][msg.sender].sub(_value);  // Subtract from the sender's allowance
        _burn(_from, _value);
        emit Approval(_from, msg.sender, _allowance[_from][msg.sender]);
        return true;
    }
}