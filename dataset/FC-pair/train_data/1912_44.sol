contract c1912{
    /// @notice Issue tokens for user.
    /// Access allowed only for oracle while the sale period is active.
    ///
    /// @param _token address for token.
    /// @param _for user address.
    /// @param _value token amount,
    function issueSoftcapToken(
        address _token, 
        address _for, 
        uint _value
    ) 
    onlyOracle
    onlyAllowed(_for)
    onlySale
    notSoftcapReached
    public
    returns (uint)
    {
        require(_token == token);
        require(_value != 0);
        uint _tokenSoftcap = tokenSoftcap;
        uint _issued = tokenSoftcapIssued;
        if (_issued.add(_value) > _tokenSoftcap) {
            _value = _tokenSoftcap.sub(_issued);
        }
        tokenSoftcapIssued = _issued.add(_value);
        if (!Token(_token).transfer(_for, _value)) {
            revert();
        }
        _emitEmission(Token(_token).smbl(), _for, _value);
        return OK;
    }
}