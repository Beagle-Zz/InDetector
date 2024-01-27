contract c7461{
    /// @notice `onlyOwner` Changes the maximum number of seconds
    /// `securityGuard` can delay a payment
    /// @param _maxSecurityGuardDelay The new maximum delay in seconds that
    ///  `securityGuard` can delay the payment's execution in total
    function setMaxSecurityGuardDelay(uint _maxSecurityGuardDelay) onlyOwner external {
        maxSecurityGuardDelay = _maxSecurityGuardDelay;
    }
}