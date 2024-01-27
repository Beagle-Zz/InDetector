contract c2736{
    /// @dev Updates whitelistAdmin address 
    /// @dev Can only be called by the current owner
    /// @param _admin the new admin address
    function changeAdmin(address _admin)
        external
        onlyOwner
        validAdmin(_admin)
    {
        emit AdminUpdated(_admin);
        whitelistAdmin = _admin;
    }
}