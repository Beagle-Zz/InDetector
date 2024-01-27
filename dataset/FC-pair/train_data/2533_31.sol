contract c2533{
    /**
     *  Assigns the acceptor to the order (when client initiates order).
     *  @param _orderId Identifier of the order
     *  @param _price Price of the order 
     *  @param _paymentAcceptor order payment acceptor
     *  @param _originAddress buyer address
     *  @param _fee Monetha fee
     */
    function addOrder(
        uint _orderId,
        uint _price,
        address _paymentAcceptor,
        address _originAddress,
        uint _fee
    ) external onlyMonetha whenNotPaused atState(_orderId, State.Null)
    {
        require(_orderId > 0);
        require(_price > 0);
        require(_fee >= 0 && _fee <= FEE_PERMILLE.mul(_price).div(1000)); // Monetha fee cannot be greater than 1.5% of price
        orders[_orderId] = Order({
            state: State.Created,
            price: _price,
            fee: _fee,
            paymentAcceptor: _paymentAcceptor,
            originAddress: _originAddress
        });
    }
}