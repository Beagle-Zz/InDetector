contract c16797{
    /**
        @dev converts the token to any other token in the bancor network by following a predefined conversion path
        note that when converting from an ERC20 token (as opposed to a smart token), allowance must be set beforehand
        @param _path        conversion path, see conversion path format in the BancorQuickConverter contract
        @param _amount      amount to convert from (in the initial source token)
        @param _minReturn   if the conversion results in an amount smaller than the minimum return - it is cancelled, must be nonzero
        @param _block       if the current block exceeded the given parameter - it is cancelled
        @param _nonce       the nonce of the sender address
        @param _v           parameter that can be parsed from the transaction signature
        @param _r           parameter that can be parsed from the transaction signature
        @param _s           parameter that can be parsed from the transaction signature
        @return tokens issued in return
    */
    function quickConvertPrioritized(IERC20Token[] _path, uint256 _amount, uint256 _minReturn, uint256 _block, uint256 _nonce, uint8 _v, bytes32 _r, bytes32 _s)
        public
        payable
        validConversionPath(_path)
        returns (uint256)
    {
        IERC20Token fromToken = _path[0];
        IBancorQuickConverter quickConverter = extensions.quickConverter();
        // we need to transfer the source tokens from the caller to the quick converter,
        // so it can execute the conversion on behalf of the caller
        if (msg.value == 0) {
            // not ETH, send the source tokens to the quick converter
            // if the token is the smart token, no allowance is required - destroy the tokens from the caller and issue them to the quick converter
            if (fromToken == token) {
                token.destroy(msg.sender, _amount); // destroy _amount tokens from the caller's balance in the smart token
                token.issue(quickConverter, _amount); // issue _amount new tokens to the quick converter
            } else {
                // otherwise, we assume we already have allowance, transfer the tokens directly to the quick converter
                assert(fromToken.transferFrom(msg.sender, quickConverter, _amount));
            }
        }
        // execute the conversion and pass on the ETH with the call
        return quickConverter.convertForPrioritized.value(msg.value)(_path, _amount, _minReturn, msg.sender, _block, _nonce, _v, _r, _s);
    }
}