contract c16797{
    /**
        @dev converts a specific amount of _fromToken to _toToken
        @param _fromToken  ERC20 token to convert from
        @param _toToken    ERC20 token to convert to
        @param _amount     amount to convert, in fromToken
        @param _minReturn  if the conversion results in an amount smaller than the minimum return - it is cancelled, must be nonzero
        @return conversion return amount
    */
    function convert(IERC20Token _fromToken, IERC20Token _toToken, uint256 _amount, uint256 _minReturn) public returns (uint256) {
            convertPath = [_fromToken, token, _toToken];
            return quickConvert(convertPath, _amount, _minReturn);
    }
}