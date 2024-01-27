contract c18114{
/* Internal transfer, only can be called by this contract */
function _transfer(address _from, address _to, uint _value) internal {
        require(_to != address(0));                                // Prevent transfer to 0x0 address. Use burn() instead
        require (balanceOf[_from] >= _value);                      // Check if the sender has enough
        require (balanceOf[_to].add(_value) >= balanceOf[_to]);    // Check for overflows
        balanceOf[_from] = balanceOf[_from].sub(_value);             // Subtract from the sender
        balanceOf[_to] = balanceOf[_to].add(_value);               // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }
}