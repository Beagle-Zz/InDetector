contract c7461{
    /// Anyone can call this function to disburse the payment to 
    ///  the recipient after `earliestPayTime` has passed
    /// @param _idPayment The payment ID to be executed
    function disburseAuthorizedPayment(uint _idPayment) disbursementsAllowed public {
        // Check that the `_idPayment` has been added to the payments struct
        require(_idPayment < authorizedPayments.length);
        Payment storage p = authorizedPayments[_idPayment];
        // Checking for reasons not to execute the payment
        require(allowedSpenders[p.spender]);
        require(_getTime() >= p.earliestPayTime);
        require(!p.canceled);
        require(!p.paid);
        p.paid = true; // Set the payment to being paid
        // Make the payment
        if (p.token == 0) {
            p.recipient.transfer(p.amount);
        } else {
            require(ERC20(p.token).transfer(p.recipient, p.amount));
        }
        emit PaymentExecuted(_idPayment, p.recipient, p.amount, p.token);
    }
}