contract c1581{
    /**
    * @dev Owner can mark a customer's Tx of payment for MCW as spent
    * @param _txPaymentForMCW the Tx of payment for MCW which will be marked as spent
    * @param _txPaymentForKWh the additional Tx of payment for KWh which will be recorded to the original Tx as proof of spend
    * @param _timestamp the timestamp of payment for KWh which will be recorded to the Tx
    */
    function setTxAsSpent(bytes32 _txPaymentForMCW, bytes32 _txPaymentForKWh, uint256 _timestamp) public onlyOwner returns(bool) {
        require(_txPaymentForMCW != 0 && _txPaymentForKWh != 0 && _timestamp != 0);
        require(txRegistry[_txPaymentForMCW].timestampPaymentMCW != 0);
        require(txRegistry[_txPaymentForMCW].timestampPaymentKWh == 0);
        txRegistry[_txPaymentForMCW].txPaymentKWh = _txPaymentForKWh;
        txRegistry[_txPaymentForMCW].timestampPaymentKWh = _timestamp;
        return true;
    }
}