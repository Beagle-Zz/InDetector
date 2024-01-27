contract c13743{
    /* This function allows _spender to withdraw from your account, multiple times, up to the _value amount.
     * If this function is called again it overwrites the current allowance with _value.
     * @param _spender address of the spender
     * @param _amount amount allowed to be withdrawal
     */
     function approve(address _spender, uint256 _amount) public returns (bool success) {
         allowed[msg.sender][_spender] = _amount;
         Approval(msg.sender, _spender, _amount);
         return true;
    } 
}