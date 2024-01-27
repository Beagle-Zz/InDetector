contract c2486{
    /// @notice Used to verify the transfer transaction according to the rule implemented in the trnasfer managers
    function verifyTransfer(address /* _from */, address _to, uint256 /* _amount */, bool /* _isTransfer */) public returns(Result) {
        if (!paused) {
            if (maxHolderCount < ISecurityToken(securityToken).investorCount()) {
                // Allow transfers to existing maxHolders
                if (ISecurityToken(securityToken).balanceOf(_to) != 0) {
                    return Result.NA;
                }
                return Result.INVALID;
            }
            return Result.NA;
        }
        return Result.NA;
    }
}