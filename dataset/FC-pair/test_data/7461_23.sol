contract c7461{
    /// @notice `onlyOwner` Sets the address of `securityGuard`
    /// @param _newSecurityGuard Address of the new security guard
    function setSecurityGuard(address _newSecurityGuard) onlyOwner external {
        securityGuard = _newSecurityGuard;
    }
}