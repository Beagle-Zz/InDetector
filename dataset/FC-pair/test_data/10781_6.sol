contract c10781{
    /* to upgrade feeAccount (eg. for fee calculation changes) */
    function setFeeAccount(TransferFeeInterface newFeeAccount) external restrict("StabilityBoard") {
        feeAccount = newFeeAccount;
        emit FeeAccountChanged(newFeeAccount);
    }
}