contract c1581{
    /**
    * @dev Owner can add a new Tx of payment for MCW to the customer's TxRegistry
    * @dev Generates the Tx of payment for MCW (hash as proof of payment) and writes the Tx data to the customer's TxRegistry
    * @dev Related event will be generated
    * @param _customer the address of a customer to whom to add a new Tx
    * @param _amountMCW the amount of MCW tokens which will be recorded to the new Tx
    * @param _amountKWh the amount of KWh which will be recorded to the new Tx
    */
    function addTxToCustomerRegistry(address _customer, uint256 _amountMCW, uint256 _amountKWh) public onlyOwner returns(bool) {
        require(isValidCustomer(_customer));
        require(_amountMCW != 0 && _amountKWh != 0);
        uint256 timestamp = now;
        bytes32 txPaymentForMCW = keccak256(
            abi.encodePacked(
                _customer,
                _amountMCW,
                _amountKWh,
                timestamp)
            );
        TxRegistry txRegistry = TxRegistry(registry[_customer]);
        require(txRegistry.getTxTimestampPaymentMCW(txPaymentForMCW) == 0);
        if (!txRegistry.addTxToRegistry(
            txPaymentForMCW,
            _amountMCW,
            _amountKWh,
            timestamp))
            revert ();
        emit NewCustomerTx(
            _customer,
            txPaymentForMCW,
            _amountMCW,
            _amountKWh,
            timestamp);
        return true;
    }
}