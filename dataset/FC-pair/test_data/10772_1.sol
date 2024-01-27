contract c10772{
    /* this function requires previous approval to transfer tokens */
    function placeSellTokenOrder(uint32 price, uint tokenAmount) external returns (uint orderId) {
        augmintToken.transferFrom(msg.sender, this, tokenAmount);
        return _placeSellTokenOrder(msg.sender, price, tokenAmount);
    }
}