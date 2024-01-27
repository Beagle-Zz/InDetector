contract c10189{
    /**
    * @dev Check if token transfer is free of any charge or not.
    * @return true if transfer is free of any charge.
    */
    function freeTransfer() public view returns (bool isTransferFree) {
        return transferFeePaymentFinished || transferFeePercentage == 0;
    }
}