contract c2485{
    /// @notice Used to verify the transfer transaction according to the rule implemented in the trnasfer managers
    function verifyTransfer(address /* _from */, address _to, uint256 _amount, bool /* _isTransfer */) public returns(Result) {
        if (!paused) {
            // If an address is on the whitelist, it is allowed to hold more than maxHolderPercentage of the tokens.
            if (whitelist[_to]) {
                return Result.NA;
            }
            uint256 newBalance = ISecurityToken(securityToken).balanceOf(_to).add(_amount);
            if (newBalance.mul(10**uint256(ISecurityToken(securityToken).decimals())).div(ISecurityToken(securityToken).totalSupply()) > maxHolderPercentage) {
                return Result.INVALID;
            }
            return Result.NA;
        }
        return Result.NA;
    }
}