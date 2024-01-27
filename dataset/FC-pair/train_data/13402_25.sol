contract c13402{
    /// @notice Transfer tokens based on allowance.
    /// msg.sender must have allowance for spending the tokens from owner ie _from
    /// @param _from Owner of the tokens
    /// @param _to Receiver of the tokens
    /// @param _value Amount of tokens to transfer
    /// @return true/false
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) { 
        require(_to != address(0));       
        require(_to != minter && _from != minter);
        require(_to != address(this) && _from != address(this));
        Proceeds proceeds = Auctions(minter).proceeds();
        require(_to != address(proceeds) && _from != address(proceeds));
        //AC can accept MET via this function, needed for MetToEth conversion
        require(_from != autonomousConverter);
        require(_allowance[_from][msg.sender] >= _value);
        _balanceOf[_from] = _balanceOf[_from].sub(_value);
        _balanceOf[_to] = _balanceOf[_to].add(_value);
        _allowance[_from][msg.sender] = _allowance[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }
}