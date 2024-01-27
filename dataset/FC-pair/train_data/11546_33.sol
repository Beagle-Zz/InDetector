contract c11546{
    /*
        @dev allows the manager to update the quick buy path
        @param _path    new quick buy path, see conversion path format in the bancorNetwork contract
    */
    function setQuickBuyPath(IERC20Token[] _path)
        public
        ownerOnly
        validConversionPath(_path)
    {
        quickBuyPath = _path;
    }
}