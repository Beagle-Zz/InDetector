contract c7487{
////////
// Owner Interface
///////
    /// @notice `onlyOwner` Cancel a payment all together
    /// @param _idPayment ID of the payment to be canceled.
    function cancelPayment(uint _idPayment) onlyOwner external {
        require(_idPayment < authorizedPayments.length);
        Payment storage p = authorizedPayments[_idPayment];
        require(!p.canceled);
        require(!p.paid);
        p.canceled = true;
        emit PaymentCanceled(_idPayment);
    }
}