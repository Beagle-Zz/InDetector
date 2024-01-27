contract c16407{
    /**
    * @dev Set url prefix
    */
    function setInfoUrlPrefix(string prefix) external contract_onlyOwner returns (string infoUrlPrefix) {
        _infoUrlPrefix = prefix;
        return _infoUrlPrefix;
    }
}