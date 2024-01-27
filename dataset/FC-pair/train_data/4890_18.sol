contract c4890{
    /// @notice Check is user registered
    ///
    /// @param _user user address
    ///
    /// @return status
    function isRegisteredUser(address _user) public view returns (bool) {
        return memberAddress2index[_user] != 0;
    }
}