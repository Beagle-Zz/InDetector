contract c13590{
    /**
    * @notice Whitelist function
    */
    function whitelistAddress(address _user, bool _flag) public onlyAdmin(1) {
        whiteList[_user] = _flag;
    }
}