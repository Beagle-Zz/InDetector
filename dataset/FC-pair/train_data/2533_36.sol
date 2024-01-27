contract c2533{
    /**
     *  processPayment transfer funds to MonethaGateway and completes the order.
     *  @param _orderId Identifier of the order
     *  @param _clientReputation Updated reputation of the client
     *  @param _merchantReputation Updated reputation of the merchant
     *  @param _dealHash Hashcode of the deal, describing the order (used for deal verification)
     */
    function processPayment(
        uint _orderId,
        uint32 _clientReputation,
        uint32 _merchantReputation,
        uint _dealHash
    )
        external onlyMonetha whenNotPaused
        atState(_orderId, State.Paid) transition(_orderId, State.Finalized)
    {
        monethaGateway.acceptPayment.value(orders[_orderId].price)(merchantWallet, orders[_orderId].fee);
        updateDealConditions(
            _orderId,
            _clientReputation,
            _merchantReputation,
            true,
            _dealHash
        );
    }
}