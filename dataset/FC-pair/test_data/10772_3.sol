contract c10772{
    /* matches any two orders if the sell price >= buy price
        trade price is the price of the maker (the order placed earlier)
        reverts if any of the orders have been removed
    */
    function matchOrders(uint64 buyTokenId, uint64 sellTokenId) external {
        require(_fillOrder(buyTokenId, sellTokenId), "fill order failed");
    }
}