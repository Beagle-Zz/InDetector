contract c2533{
    /**
     *  refundPayment used in case order cannot be processed.
     *  This function initiate process of funds refunding to the client.
     *  @param _orderId Identifier of the order
     *  @param _clientReputation Updated reputation of the client
     *  @param _merchantReputation Updated reputation of the merchant
     *  @param _dealHash Hashcode of the deal, describing the order (used for deal verification)
     *  @param _refundReason Order refund reason, order will be moved to State Cancelled after Client withdraws money
     */
    function refundPayment(
        uint _orderId,
        uint32 _clientReputation,
        uint32 _merchantReputation,
        uint _dealHash,
        string _refundReason
    )   
        external onlyMonetha whenNotPaused
        atState(_orderId, State.Paid) transition(_orderId, State.Refunding)
    {
        require(bytes(_refundReason).length > 0);
        Order storage order = orders[_orderId];
        updateDealConditions(
            _orderId,
            _clientReputation,
            _merchantReputation,
            false,
            _dealHash
        );
        merchantHistory.recordDealRefundReason(
            _orderId,
            order.originAddress,
            _clientReputation,
            _merchantReputation,
            _dealHash,
            _refundReason
        );
    }
}