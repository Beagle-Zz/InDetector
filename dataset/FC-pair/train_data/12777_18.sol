contract c12777{
    /**
        @dev converts the token to any other token in the bancor network
        by following a predefined conversion path and transfers the result
        tokens to a target account.
        this specific version of the function also allows the verified signer
        to bypass the universal gas price limit.
        note that the converter should already own the source tokens
        @param _path        conversion path, see conversion path format above
        @param _amount      amount to convert from (in the initial source token)
        @param _minReturn   if the conversion results in an amount smaller than the minimum return - it is cancelled, must be nonzero
        @param _for         account that will receive the conversion result
        @return tokens issued in return
    */
    function convertForPrioritized(IERC20Token[] _path, uint256 _amount, uint256 _minReturn, address _for, uint256 _block, uint256 _nonce, uint8 _v, bytes32 _r, bytes32 _s)
        public
        payable
        validConversionPath(_path)
        returns (uint256)
    {
        if (_v == 0x0 && _r == 0x0 && _s == 0x0)
            gasPriceLimit.validateGasPrice(tx.gasprice);
        else
            require(verifyTrustedSender(_block, _for, _nonce, _v, _r, _s));
        // if ETH is provided, ensure that the amount is identical to _amount and verify that the source token is an ether token
        IERC20Token fromToken = _path[0];
        require(msg.value == 0 || (_amount == msg.value && etherTokens[fromToken]));
        IERC20Token toToken;
        // if ETH was sent with the call, the source is an ether token - deposit the ETH in it
        // otherwise, we assume we already have the tokens
        if (msg.value > 0)
            IEtherToken(fromToken).deposit.value(msg.value)();
        (_amount, toToken) = convertByPath(_path, _amount, _minReturn, fromToken);
        // finished the conversion, transfer the funds to the target account
        // if the target token is an ether token, withdraw the tokens and send them as ETH
        // otherwise, transfer the tokens as is
        if (etherTokens[toToken])
            IEtherToken(toToken).withdrawTo(_for, _amount);
        else
            assert(toToken.transfer(_for, _amount));
        return _amount;
    }
}