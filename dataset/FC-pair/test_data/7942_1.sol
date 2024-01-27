contract c7942{
    /// @dev set the token's tokenExchangeRate,
    function setTokenExchangeRate(uint256 _tokenExchangeRate) isOwner external {
        require (_tokenExchangeRate != 0);
        require (_tokenExchangeRate != tokenExchangeRate);
        tokenExchangeRate = _tokenExchangeRate;
    }
}