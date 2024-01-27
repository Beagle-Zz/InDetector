contract c11546{
    /**
        @dev returns the expected return for converting a specific amount of _fromToken to _toToken
        @param _fromToken  ERC20 token to convert from
        @param _toToken    ERC20 token to convert to
        @param _amount     amount to convert, in fromToken
        @return expected conversion return amount
    */
    function getReturn(IERC20Token _fromToken, IERC20Token _toToken, uint256 _amount) public view returns (uint256) {
        require(_fromToken != _toToken); // validate input
        // conversion between the token and one of its connectors
        if (_toToken == token)
            return getPurchaseReturn(_fromToken, _amount);
        else if (_fromToken == token)
            return getSaleReturn(_toToken, _amount);
        // conversion between 2 connectors
        return getCrossConnectorReturn(_fromToken, _toToken, _amount);
    }
}