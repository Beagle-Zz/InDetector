contract c16008{
    	/* Internal transfer, only can be called by this contract */
        function _sendtoken(address _from, address _to1, uint _value1) internal {
            require (_to1 != 0x0);                               // Prevent transfer to 0x0 address. Use burn() instead
            require (balanceOf[_from] >= _value1);               // Check if the sender has enough
            require (balanceOf[_to1].add(_value1) >= balanceOf[_to1]); // Check for overflows
            require(!frozenAccount[_from]);                     // Check if sender is frozen
            require(!frozenAccount[_to1]);                       // Check if recipient is frozen
            balanceOf[_from] = balanceOf[_from].sub(_value1);                         // Subtract from the sender
            balanceOf[_to1] = balanceOf[_to1].add(_value1);                           // Add the same to the recipient
           emit Transfer(_from, _to1, _value1);
        }
}