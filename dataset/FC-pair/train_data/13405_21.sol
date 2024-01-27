contract c13405{
    /// @notice allow minter and tokenPorter to mint token and assign to address
    /// @param _to 
    /// @param _value Amount to be minted  
    function mint(address _to, uint _value) public returns (bool) {
        require(msg.sender == minter || msg.sender == address(tokenPorter));
        _balanceOf[_to] = _balanceOf[_to].add(_value);
        _totalSupply = _totalSupply.add(_value);
        emit Mint(_to, _value);
        emit Transfer(0x0, _to, _value);
        return true;
    }
}