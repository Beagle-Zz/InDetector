contract c1911{
    /// @notice Issue tokens for user.
    /// Access allowed only for oracle while the sale period is active.
    ///
    /// @param _token address for token.
    /// @param _for user address.
    /// @param _value token amount,
    function issueHardcapToken(
        address _token, 
        address _for, 
        uint _value
    ) 
    onlyOracle 
    onlyAllowed(_for) 
    onlySale 
    notHardcapReached 
    public
    returns (uint) 
    {
        require(_token == token);
        require(_value != 0);
        uint _tokenHardcap = tokenHardcapValue;
        uint _issued = tokenHardcapIssuedValue;
        if (_issued.add(_value) > _tokenHardcap) {
            _value = _tokenHardcap.sub(_issued);
        }
        tokenHardcapIssuedValue = _issued.add(_value);
        bytes32 _symbol = Token(_token).smbl();
        if (OK != Platform(Token(_token).platform()).reissueAsset(_symbol, _value)) {
            revert();
        }
        if (!Token(_token).transfer(_for, _value)) {
            revert();
        }
        _emitEmission(_symbol, _for, _value);
        return OK;
    }
}