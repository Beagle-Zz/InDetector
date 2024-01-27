contract c7461{
/////////
// SecurityGuard Interface
/////////
    /// @notice `onlySecurityGuard` Delays a payment for a set number of seconds
    /// @param _idPayment ID of the payment to be delayed
    /// @param _delay The number of seconds to delay the payment
    function delayPayment(uint _idPayment, uint _delay) onlySecurityGuard external {
        require(_idPayment < authorizedPayments.length);
        // Overflow test
        require(_delay <= 10**18);
        Payment storage p = authorizedPayments[_idPayment];
        require(p.securityGuardDelay + _delay <= maxSecurityGuardDelay);
        require(!p.paid);
        require(!p.canceled);
        p.securityGuardDelay += _delay;
        p.earliestPayTime += _delay;
    }
}