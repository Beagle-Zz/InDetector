contract c3970{
    /// @dev set the token's tokenExchangeRate,
    function setTokenExchangeRate(uint256 _tokenExchangeRate) isOwner external {
        if (_tokenExchangeRate == 0) throw;
        if (_tokenExchangeRate == tokenExchangeRate) throw;
        tokenExchangeRate = _tokenExchangeRate;
    }
}