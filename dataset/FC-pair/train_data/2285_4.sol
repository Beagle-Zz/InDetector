contract c2285{
    /**
    *@dev unlist allows a party to remove their order from the orderbook
    *@param _orderId is the uint256 ID of order
    */
    function unlist(uint256 _orderId) external{
        require(forSaleIndex[_orderId] > 0);
        Order memory _order = orders[_orderId];
        require(msg.sender== _order.maker || msg.sender == owner);
        unLister(_orderId,_order);
        emit OrderRemoved(msg.sender,_order.asset,_order.amount,_order.price);
    }
}