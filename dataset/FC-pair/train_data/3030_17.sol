contract c3030{
    /**
    * @dev check if address is whitelisted for factory
    * @param _factory Address of factory
    * @param _user Address of user
    * @return True if user is whitelisted for given factory, false instead
    **/
    function isWhitelisted(address _factory, address _user) public constant returns (bool) {
        return whitelisted[_factory][_user];
    }
}