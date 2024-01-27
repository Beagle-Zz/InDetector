contract c3105{
    /**
     * @dev Submit a sealed purchase order. Wei sent can be different then sealed value.
     * @param _sealedPurchaseOrder The sealed purchase order.
     */
    function placePurchaseOrder(bytes32 _sealedPurchaseOrder) public payable {
        if (block.number.sub(periods[currentPeriodIndex()].started) > PERIOD_BLOCKS) {
            nextPeriod();
        }
        // Note: current period index may update from above call
        Period storage period = periods[currentPeriodIndex()];
        // Each address can only make a single purchase per period
        require(period.sealedPurchaseOrders[msg.sender] == bytes32(0));
        period.sealedPurchaseOrders[msg.sender] = _sealedPurchaseOrder;
        period.receivedBalances[msg.sender] = msg.value;
        emit SealedOrderPlaced(msg.sender, currentPeriodIndex(), msg.value);
    }
}