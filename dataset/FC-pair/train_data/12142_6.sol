contract c12142{
    /**
    * @notice whiteList handler
    */
    function whitelistAddress(address _user, bool _flag) onlyAdmin(1) public {
        whiteList[_user] = _flag;
    }
}