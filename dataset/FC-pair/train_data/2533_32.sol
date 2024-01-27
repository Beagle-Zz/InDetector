contract c2533{
    /**
     *  securePay can be used by client if he wants to securely set client address for refund together with payment.
     *  This function require more gas, then fallback function.
     *  @param _orderId Identifier of the order
     */
    function securePay(uint _orderId)
        external payable whenNotPaused
        atState(_orderId, State.Created) transition(_orderId, State.Paid)
    {
        Order storage order = orders[_orderId];
        require(msg.sender == order.paymentAcceptor);
        require(msg.value == order.price);
    }
}