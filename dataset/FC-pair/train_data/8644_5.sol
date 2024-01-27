contract c8644{
    /// @notice `Allow | Prevent` `target` from sending & receiving tokens
    /// @param target Address to be allowed or not
    /// @param approve either to allow it or not
    function approveAccount(address target, bool approve) onlyAdmin public {
        approvedAccount[target] = approve;
        emit ApprovedAccount(target, approve);
    }
}