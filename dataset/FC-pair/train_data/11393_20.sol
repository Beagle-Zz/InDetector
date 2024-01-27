contract c11393{
    /**
        @dev converts token to any other token in the bancor network
        by following the predefined conversion paths and transfers the result
        tokens to a targeted account.
        this version of the function also allows multiple conversions
        in a single atomic transaction.
        note that the converter should already own the source tokens
        @param _paths           merged conversion paths, i.e. [path1, path2, ...]. see conversion path format above
        @param _pathStartIndex  each item in the array is the start index of the nth path in _paths
        @param _amounts         amount to convert from (in the initial source token) for each path
        @param _minReturns      minimum return for each path. if the conversion results in an amount 
                                smaller than the minimum return - it is cancelled, must be nonzero
        @param _for             account that will receive the conversions result
        @return amount of conversion result for each path
    */
    function convertForMultiple(IERC20Token[] _paths, uint256[] _pathStartIndex, uint256[] _amounts, uint256[] _minReturns, address _for)
        public
        payable
        returns (uint256[])
    {
        // if ETH is provided, ensure that the total amount was converted into other tokens
        uint256 convertedValue = 0;
        uint256 pathEndIndex;
        // iterate over the conversion paths
        for (uint256 i = 0; i < _pathStartIndex.length; i += 1) {
            pathEndIndex = i == (_pathStartIndex.length - 1) ? _paths.length : _pathStartIndex[i + 1];
            // copy a single path from _paths into an array
            IERC20Token[] memory path = new IERC20Token[](pathEndIndex - _pathStartIndex[i]);
            for (uint256 j = _pathStartIndex[i]; j < pathEndIndex; j += 1) {
                path[j - _pathStartIndex[i]] = _paths[j];
            }
            // if ETH is provided, ensure that the amount is lower than the path amount and
            // verify that the source token is an ether token. otherwise ensure that 
            // the source is not an ether token
            IERC20Token fromToken = path[0];
            require(msg.value == 0 || (_amounts[i] <= msg.value && etherTokens[fromToken]) || !etherTokens[fromToken]);
            // if ETH was sent with the call, the source is an ether token - deposit the ETH path amount in it.
            // otherwise, we assume we already have the tokens
            if (msg.value > 0 && etherTokens[fromToken]) {
                IEtherToken(fromToken).deposit.value(_amounts[i])();
                convertedValue += _amounts[i];
            }
            _amounts[i] = convertForInternal(path, _amounts[i], _minReturns[i], _for, 0x0, 0x0, 0x0, 0x0);
        }
        // if ETH was provided, ensure that the full amount was converted
        require(convertedValue == msg.value);
        return _amounts;
    }
}