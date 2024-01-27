contract c2532{
    /**
     *  refundPayment used in case order cannot be processed and funds need to be returned
     *  This function initiate process of funds refunding to the client.
     *  @param _orderId Identifier of the order
     *  @param _clientAddress is an address of client
     *  @param _refundReason Order refund reason
     */
    function refundPayment(
        uint _orderId,
        address _clientAddress,
        string _refundReason
    ) external payable onlyMonetha whenNotPaused
    {
        require(_orderId > 0);
        require(_clientAddress != 0x0);
        require(msg.value > 0);
        require(WithdrawState.Null == withdrawals[_orderId].state);
        // create withdraw
        withdrawals[_orderId] = Withdraw({
            state: WithdrawState.Pending,
            amount: msg.value,
            clientAddress: _clientAddress
            });
        // log refunding
        PaymentRefunding(_orderId, _clientAddress, msg.value, _refundReason);
    }
}