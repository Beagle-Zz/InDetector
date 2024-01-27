contract c11549{
    /**
        @dev converts the token to any other token in the bancor network by following a predefined conversion path
        note that when converting from an ERC20 token (as opposed to a smart token), allowance must be set beforehand
        @param _path        conversion path, see conversion path format in the BancorNetwork contract
        @param _amount      amount to convert from (in the initial source token)
        @param _minReturn   if the conversion results in an amount smaller than the minimum return - it is cancelled, must be nonzero
        @param _block       if the current block exceeded the given parameter - it is cancelled
        @param _v           (signature[128:130]) associated with the signer address and helps validating if the signature is legit
        @param _r           (signature[0:64]) associated with the signer address and helps validating if the signature is legit
        @param _s           (signature[64:128]) associated with the signer address and helps validating if the signature is legit
        @return tokens issued in return
    */
    function quickConvertPrioritized(IERC20Token[] _path, uint256 _amount, uint256 _minReturn, uint256 _block, uint8 _v, bytes32 _r, bytes32 _s)
        public
        payable
        validConversionPath(_path)
        returns (uint256)
    {
        IERC20Token fromToken = _path[0];
        IBancorNetwork bancorNetwork = IBancorNetwork(registry.getAddress(ContractIds.BANCOR_NETWORK));
        // we need to transfer the source tokens from the caller to the BancorNetwork contract,
        // so it can execute the conversion on behalf of the caller
        if (msg.value == 0) {
            // not ETH, send the source tokens to the BancorNetwork contract
            // if the token is the smart token, no allowance is required - destroy the tokens
            // from the caller and issue them to the BancorNetwork contract
            if (fromToken == token) {
                token.destroy(msg.sender, _amount); // destroy _amount tokens from the caller's balance in the smart token
                token.issue(bancorNetwork, _amount); // issue _amount new tokens to the BancorNetwork contract
            } else {
                // otherwise, we assume we already have allowance, transfer the tokens directly to the BancorNetwork contract
                assert(fromToken.transferFrom(msg.sender, bancorNetwork, _amount));
            }
        }
        // execute the conversion and pass on the ETH with the call
        return bancorNetwork.convertForPrioritized.value(msg.value)(_path, _amount, _minReturn, msg.sender, _block, _v, _r, _s);
    }
}