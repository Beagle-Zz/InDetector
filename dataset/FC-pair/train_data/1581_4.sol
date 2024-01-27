contract c1581{
    /**
    * @dev Owner can add a new Tx of payment for MCW to the customer's TxRegistry
    * @param _txPaymentForMCW the Tx of payment for MCW which will be added
    * @param _amountMCW the amount of MCW tokens which will be recorded to the new Tx
    * @param _amountKWh the amount of KWh which will be recorded to the new Tx
    * @param _timestamp the timestamp of payment for MCW which will be recorded to the new Tx
    */
    function addTxToRegistry(
        bytes32 _txPaymentForMCW,
        uint256 _amountMCW,
        uint256 _amountKWh,
        uint256 _timestamp
        ) public onlyOwner returns(bool)
    {
        require(_txPaymentForMCW != 0 && _amountMCW != 0 && _amountKWh != 0 && _timestamp != 0);
        require(txRegistry[_txPaymentForMCW].timestampPaymentMCW == 0);
        txRegistry[_txPaymentForMCW].amountMCW = _amountMCW;
        txRegistry[_txPaymentForMCW].amountKWh = _amountKWh;
        txRegistry[_txPaymentForMCW].timestampPaymentMCW = _timestamp;
        txIndex.push(_txPaymentForMCW);
        return true;
    }
}