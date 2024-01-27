contract c1581{
    /**
    * @dev Owner can mark a customer's Tx of payment for MCW as spent
    * @dev Generates an additional Tx of paymant for KWh (hash as proof of spend), which connected to the original Tx.
    * @dev Related event will be generated
    * @param _customer the address of a customer to whom to spend a Tx
    * @param _txPaymentForMCW the Tx of payment for MCW which will be marked as spent
    */
    function setCustomerTxAsSpent(address _customer, bytes32 _txPaymentForMCW) public onlyOwner returns(bool) {
        require(isValidCustomer(_customer));
        TxRegistry txRegistry = TxRegistry(registry[_customer]);
        require(txRegistry.getTxTimestampPaymentMCW(_txPaymentForMCW) != 0);
        require(txRegistry.getTxTimestampPaymentKWh(_txPaymentForMCW) == 0);
        uint256 timestamp = now;
        bytes32 txPaymentForKWh = keccak256(
            abi.encodePacked(
                _txPaymentForMCW,
                timestamp)
            );
        if (!txRegistry.setTxAsSpent(_txPaymentForMCW, txPaymentForKWh, timestamp))
            revert ();
        emit SpendCustomerTx(
            _customer,
            _txPaymentForMCW,
            txPaymentForKWh,
            timestamp);
        return true;
    }
}