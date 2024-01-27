contract c16440{
    /**
        @dev copies the quick buy path from the old converter to the new one
        @param _oldConverter    old converter contract address
        @param _newConverter    new converter contract address
    */
    function copyQuickBuyPath(IBancorConverter _oldConverter, IBancorConverter _newConverter) private {
        uint256 quickBuyPathLength = _oldConverter.getQuickBuyPathLength();
        if (quickBuyPathLength <= 0)
            return;
        IERC20Token[] memory path = new IERC20Token[](quickBuyPathLength);
        for (uint256 i = 0; i < quickBuyPathLength; i++) {
            path[i] = _oldConverter.quickBuyPath(i);
        }
        _newConverter.setQuickBuyPath(path);
    }
}