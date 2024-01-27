contract c8715{
    /**
    * Internal transfer, only can be called by this contract
    */
    function _transfer(address _from, address _to, uint256 _value)
    internal {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != address(0), "use burn() instead");
        // Check if the sender has enough
        require(_balanceOf[_from] >= _value, "not enough balance");
        // Subtract from the sender
        _balanceOf[_from] = _balanceOf[_from].sub(_value);
        // Add the same to the recipient
        _balanceOf[_to] = _balanceOf[_to].add(_value);
        emit Transfer(_from, _to, _value);
    }
}