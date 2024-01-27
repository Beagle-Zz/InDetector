contract c16389{
    /// @dev Change token name
    /// @param _name string
    function setName(string _name) public ifAuthorized(msg.sender, APHRODITE) {
        name = _name;
    }
}