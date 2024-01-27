contract c13403{
    /// @notice Transfer tokens from sender to the provided address.
    /// @param _to Receiver of the tokens
    /// @param _value Amount of token
    /// @return true/false
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_to != minter);
        require(_to != address(this));
        require(_to != autonomousConverter);
        Proceeds proceeds = Auctions(minter).proceeds();
        require((_to != address(proceeds)));
        _balanceOf[msg.sender] = _balanceOf[msg.sender].sub(_value);
        _balanceOf[_to] = _balanceOf[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}