contract c2533{
    /**
     *  cancelOrder is used when client doesn't pay and order need to be cancelled.
     *  @param _orderId Identifier of the order
     *  @param _clientReputation Updated reputation of the client
     *  @param _merchantReputation Updated reputation of the merchant
     *  @param _dealHash Hashcode of the deal, describing the order (used for deal verification)
     *  @param _cancelReason Order cancel reason
     */
    function cancelOrder(
        uint _orderId,
        uint32 _clientReputation,
        uint32 _merchantReputation,
        uint _dealHash,
        string _cancelReason
    )
        external onlyMonetha whenNotPaused
        atState(_orderId, State.Created) transition(_orderId, State.Cancelled)
    {
        require(bytes(_cancelReason).length > 0);
        Order storage order = orders[_orderId];
        updateDealConditions(
            _orderId,
            _clientReputation,
            _merchantReputation,
            false,
            _dealHash
        );
        merchantHistory.recordDealCancelReason(
            _orderId,
            order.originAddress,
            _clientReputation,
            _merchantReputation,
            _dealHash,
            _cancelReason
        );
    }
}