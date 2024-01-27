contract c4863{
    /// @notice Discard user registration
    /// Can be called only by contract owner
    ///
    /// @param _user user address
    ///
    /// @return code
    function unregisterUser(address _user) external onlyContractOwner returns (uint) {
        require(_user != 0x0);
        uint _memberIndex = memberAddress2index[_user];
        if (_memberIndex == 0 || address2member[_user].groupsCount != 0) {
            return USER_MANAGER_INVALID_INVOCATION;
        }
        uint _membersCount = membersCount;
        delete memberAddress2index[_user];
        if (_memberIndex != _membersCount) {
            address _lastUser = index2memberAddress[_membersCount];
            index2memberAddress[_memberIndex] = _lastUser;
            memberAddress2index[_lastUser] = _memberIndex;
        }
        delete address2member[_user];
        delete index2memberAddress[_membersCount];
        delete memberAddress2index[_user];
        membersCount = _membersCount.sub(1);
        UserDeleted(_user);
        return OK;
    }
}