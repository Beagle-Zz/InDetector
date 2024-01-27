contract c12563{
    /// @dev Performs a single trade via the requested exchange handler
    /// @param buyOrSell Boolean value stating whether this is a buy or sell order
    /// @param initialRemaining The remaining value we have left to trade
    /// @param totalObtained The total amount we have obtained so far
    /// @param orders Struct containing all DEX orders
    /// @param index Value indicating the index of the specific DEX order we wish to execute
    /// @return Remaining value left after trade
    /// @return Total value obtained after trade
    function performTrade(bool buyOrSell, uint256 initialRemaining, uint256 totalObtained, DEXOrders orders, uint256 index)
        internal returns (uint256, uint256) {
        uint256 obtained = 0;
        uint256 remaining = initialRemaining;
        require(orders.exchangeFees[index] < MAX_EXCHANGE_FEE_PERCENTAGE);
        uint256 amountToFill = getAmountToFill(remaining, orders, index);
        if(amountToFill > 0) {
            remaining = SafeMath.sub(remaining, amountToFill);
            if(buyOrSell == BUY) {
                obtained = ExchangeHandler(orders.exchanges[index]).performBuy.value(amountToFill)(
                    orders.orderAddresses[index],
                    orders.orderValues[index],
                    orders.exchangeFees[index],
                    amountToFill,
                    orders.v[index],
                    orders.r[index],
                    orders.s[index]
                );
            } else {
                require(Token(orders.tokenForOrder[index]).transfer(
                    orders.exchanges[index],
                    amountToFill
                ));
                obtained = ExchangeHandler(orders.exchanges[index]).performSell(
                    orders.orderAddresses[index],
                    orders.orderValues[index],
                    orders.exchangeFees[index],
                    amountToFill,
                    orders.v[index],
                    orders.r[index],
                    orders.s[index]
                );
            }
        }
        return (obtained == 0 ? initialRemaining: remaining, SafeMath.add(totalObtained, obtained));
    }
}