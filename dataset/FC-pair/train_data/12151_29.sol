contract c12151{
    /**
     * @dev Cancel an order, preventing it from being matched. Must be called by the maker of the order
     * @param order Order to cancel
     * @param sig ECDSA signature
     */
    function cancelOrder(Order memory order, Sig memory sig) 
        internal
    {
        /* CHECKS */
        /* Calculate order hash. */
        bytes32 hash = requireValidOrder(order, sig);
        /* Assert sender is authorized to cancel order. */
        require(msg.sender == order.maker);
        /* EFFECTS */
        /* Mark order as cancelled, preventing it from being matched. */
        cancelledOrFinalized[hash] = true;
        /* Log cancel event. */
        emit OrderCancelled(hash);
    }
}