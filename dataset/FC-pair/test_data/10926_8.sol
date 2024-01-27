contract c10926{
    /**
    * @dev Destroys the amount of tokens and lowers total supply
    *
    * @param _amount Number of tokens user wants to destroy
    */
    function burn(uint _amount) public {
        balances[msg.sender] = safeSub(balanceOf(msg.sender), _amount);
        supply = safeSub(supply, _amount);
        emit Burn(msg.sender, _amount);
        emit Transfer(msg.sender, 0x0, _amount);
    }
}