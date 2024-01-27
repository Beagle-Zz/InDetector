contract c2533{
    /**
     *  withdrawRefund performs fund transfer to the client's account.
     *  @param _orderId Identifier of the order
     */
    function withdrawRefund(uint _orderId) 
        external whenNotPaused
        atState(_orderId, State.Refunding) transition(_orderId, State.Refunded) 
    {
        Order storage order = orders[_orderId];
        order.originAddress.transfer(order.price);
    }
}