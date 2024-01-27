contract c8524{
    /**
        @dev helper, dispatches the Conversion event
        @param _fromToken       ERC20 token to convert from
        @param _toToken         ERC20 token to convert to
        @param _amount          amount purchased/sold (in the source token)
        @param _returnAmount    amount returned (in the target token)
    */
    function dispatchConversionEvent(IERC20Token _fromToken, IERC20Token _toToken, uint256 _amount, uint256 _returnAmount, uint256 _feeAmount) private {
        // fee amount is converted to 255 bits -
        // negative amount means the fee is taken from the source token, positive amount means its taken from the target token
        // currently the fee is always taken from the target token
        // since we convert it to a signed number, we first ensure that it's capped at 255 bits to prevent overflow
        assert(_feeAmount <= 2 ** 255);
        emit Conversion(_fromToken, _toToken, msg.sender, _amount, _returnAmount, int256(_feeAmount));
    }
}