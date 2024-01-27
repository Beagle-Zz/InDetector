contract c8715{
    //internal burn function
    function _burn(address _from, uint256 _value)
    internal {
        require(_balanceOf[_from] >= _value, "balance too low");               // Check if the targeted balance is enough
        _balanceOf[_from] = _balanceOf[_from].sub(_value);  // Subtract from the sender
        totalSupply = totalSupply.sub(_value);              // Updates totalSupply
        emit Burn(msg.sender, _value);
        emit Transfer(_from, address(0), _value);
    }
}