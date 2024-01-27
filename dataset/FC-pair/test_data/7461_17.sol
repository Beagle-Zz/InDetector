contract c7461{
////////
// Spender Interface
////////
    /// @notice only `allowedSpenders[]` Creates a new `Payment`
    /// @param _name Brief description of the payment that is authorized
    /// @param _reference External reference of the payment
    /// @param _recipient Destination of the payment
    /// @param _amount Amount to be paid in wei
    /// @param _paymentDelay Number of seconds the payment is to be delayed, if
    ///  this value is below `timeLock` then the `timeLock` determines the delay
    /// @return The Payment ID number for the new authorized payment
    function authorizePayment(
        string _name,
        bytes32 _reference,
        address _recipient,
        address _token,
        uint _amount,
        uint _paymentDelay
    ) whenNotPaused external returns(uint) {
        // Fail if you arent on the `allowedSpenders` white list
        require(allowedSpenders[msg.sender]);
        uint idPayment = authorizedPayments.length;       // Unique Payment ID
        authorizedPayments.length++;
        // The following lines fill out the payment struct
        Payment storage p = authorizedPayments[idPayment];
        p.spender = msg.sender;
        // Overflow protection
        require(_paymentDelay <= 10**18);
        // Determines the earliest the recipient can receive payment (Unix time)
        p.earliestPayTime = _paymentDelay >= timeLock ?
                                _getTime() + _paymentDelay :
                                _getTime() + timeLock;
        p.recipient = _recipient;
        p.amount = _amount;
        p.name = _name;
        p.reference = _reference;
        p.token = _token;
        emit PaymentAuthorized(idPayment, p.recipient, p.amount, p.token, p.reference);
        return idPayment;
    }
}