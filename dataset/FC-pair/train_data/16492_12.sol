contract c16492{
    /**
    * @dev Set url prefix, of course that won`t change the existing Chibi urls on chain
    */
    function setInfoUrlPrefix(string prefix) external contract_onlyOwner returns (bool success) {
        _infoUrlPrefix = prefix;
        return true;
    }
}