contract c18007{
/**
        @dev converts the token to any other token in the bancor network by following
        a predefined conversion path and transfers the result tokens to a target account
        note that the converter should already own the source tokens
        @param _path        conversion path, see conversion path format above
        @param _amount      amount to convert from (in the initial source token)
        @param _minReturn   if the conversion results in an amount smaller than the minimum return - it is cancelled, must be nonzero
        @param _for         account that will receive the conversion result
        @return tokens issued in return
    */
    function convertFor(IERC20Token[] _path, uint256 _amount, uint256 _minReturn, address _for) public payable returns (uint256) {
        return convertForPrioritized(_path, _amount, _minReturn, _for, 0x0, 0x0, 0x0, 0x0, 0x0);
    }
}