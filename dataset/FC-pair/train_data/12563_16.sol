contract c12563{
    /// @dev Get the amount of this order we are able to fill
    /// @param remaining Amount we have left to spend
    /// @param orders Struct containing all DEX orders
    /// @param index Value indicating the index of the specific DEX order we wish to execute
    /// @return Minimum of the amount we have left to spend and the available amount at the exchange
    function getAmountToFill(uint256 remaining, DEXOrders orders, uint256 index) internal returns (uint256) {
        uint256 availableAmount = ExchangeHandler(orders.exchanges[index]).getAvailableAmount(
            orders.orderAddresses[index],
            orders.orderValues[index],
            orders.exchangeFees[index],
            orders.v[index],
            orders.r[index],
            orders.s[index]
        );
        return Math.min256(remaining, availableAmount);
    }
}