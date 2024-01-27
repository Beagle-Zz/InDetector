contract c10189{
    /**
    * @dev Stop trasfer fee payment for tokens.
    * @return true if the operation was successful.
    */
    function finishTransferFeePayment() public onlyOwner returns(bool finished) {
        require(!transferFeePaymentFinished, "transfer fee finished");
        transferFeePaymentFinished = true;
        emit LogTransferFeePaymentFinished(msg.sender);
        return true;
    }
}