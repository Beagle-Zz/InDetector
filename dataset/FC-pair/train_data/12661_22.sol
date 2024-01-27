contract c12661{
    /**
    * @dev Function to burn sender's tokens
    * @param _amount The amount of tokens to burn.
    * @return A boolean that indicates if the operation was successful.
    */
    function burn(uint256 _amount, bytes _userData) public {
        require (_amount > 0);
        require (balanceOf[msg.sender] >= _amount);
        requireMultiple(_amount);
        callSender(msg.sender, msg.sender, 0x0, _amount, _userData, "");
        totalSupply = totalSupply.sub(_amount);
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_amount);
        emit Burned(msg.sender, msg.sender, _amount, _userData, "");
        emit Transfer(msg.sender, 0x0, _amount);
    }
}