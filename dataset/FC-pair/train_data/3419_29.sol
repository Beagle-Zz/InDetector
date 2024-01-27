contract c3419{
    // PUBLIC : FEES
    /// @dev Quantity of asset held in exchange according to associated order id
    /// @param ofAsset Address of asset
    /// @return Quantity of input asset held in exchange
    function quantityHeldInCustodyOfExchange(address ofAsset) returns (uint) {
        uint totalSellQuantity;     // quantity in custody across exchanges
        uint totalSellQuantityInApprove; // quantity of asset in approve (allowance) but not custody of exchange
        for (uint i; i < exchanges.length; i++) {
            if (exchangesToOpenMakeOrders[exchanges[i].exchange][ofAsset].id == 0) {
                continue;
            }
            var (sellAsset, , sellQuantity, ) = GenericExchangeInterface(exchanges[i].exchangeAdapter).getOrder(exchanges[i].exchange, exchangesToOpenMakeOrders[exchanges[i].exchange][ofAsset].id);
            if (sellQuantity == 0) {    // remove id if remaining sell quantity zero (closed)
                delete exchangesToOpenMakeOrders[exchanges[i].exchange][ofAsset];
            }
            totalSellQuantity = add(totalSellQuantity, sellQuantity);
            if (!exchanges[i].takesCustody) {
                totalSellQuantityInApprove += sellQuantity;
            }
        }
        if (totalSellQuantity == 0) {
            isInOpenMakeOrder[sellAsset] = false;
        }
        return sub(totalSellQuantity, totalSellQuantityInApprove); // Since quantity in approve is not actually in custody
    }
}