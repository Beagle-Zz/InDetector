contract c7487{
/////////////////////
// Spender Interface
/////////////////////
    /**
    * Disburse an authorizedPayment to the recipient if all checks pass.
    *
    * @param _idPayment The payment ID to be disbursed
    */
    function disburseAuthorizedPayment(uint _idPayment) disbursementsAllowed public {
        // Check that the `_idPayment` has been added to the payments struct
        require(_idPayment < authorizedPayments.length);
        Payment storage p = authorizedPayments[_idPayment];
        // The current minimum delay for a payment is `timeLock`. Thus the following ensuress
        // that the `securityGuard` has checked in after the payment was created
        // @notice earliestPayTime is updated when a payment is delayed. Which may require
        // another checkIn before the payment can be collected.
        // @notice We add 30 mins to this to reduce (not eliminate) the risk of front-running
        require(securityGuardLastCheckin >= p.earliestPayTime - timeLock + 30 minutes);
        super.disburseAuthorizedPayment(_idPayment);
    }
}