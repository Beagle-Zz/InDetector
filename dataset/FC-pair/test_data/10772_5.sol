contract c10772{
    // returns CHUNK_SIZE orders starting from offset
    // orders are encoded as [id, maker, price, amount]
    function getActiveBuyOrders(uint offset) external view returns (uint[4][CHUNK_SIZE] response) {
        for (uint8 i = 0; i < CHUNK_SIZE && i + offset < activeBuyOrders.length; i++) {
            uint64 orderId = activeBuyOrders[offset + i];
            Order storage order = buyTokenOrders[orderId];
            response[i] = [orderId, uint(order.maker), order.price, order.amount];
        }
    }
}