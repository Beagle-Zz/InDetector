contract c2533{
    /**
     *  Performs a transition after function execution.
     *  @param _state Next state
     *  @param _orderId Order Id
     */
    modifier transition(uint _orderId, State _state) {
        _;
        orders[_orderId].state = _state;
    }
}