contract c2285{
    /**
    *@dev An internal function to update mappings when an order is removed from the book
    *@param _orderId is the uint256 ID of order
    *@param _order is the struct containing the details of the order
    */
    function unLister(uint256 _orderId, Order _order) internal{
            uint256 tokenIndex;
            uint256 lastTokenIndex;
            address lastAdd;
            uint256  lastToken;
        if(forSale[_order.asset].length == 2){
            tokenIndex = openBookIndex[_order.asset];
            lastTokenIndex = openBooks.length.sub(1);
            lastAdd = openBooks[lastTokenIndex];
            openBooks[tokenIndex] = lastAdd;
            openBookIndex[lastAdd] = tokenIndex;
            openBooks.length--;
            openBookIndex[_order.asset] = 0;
            forSale[_order.asset].length -= 2;
        }
        else{
            tokenIndex = forSaleIndex[_orderId];
            lastTokenIndex = forSale[_order.asset].length.sub(1);
            lastToken = forSale[_order.asset][lastTokenIndex];
            forSale[_order.asset][tokenIndex] = lastToken;
            forSaleIndex[lastToken] = tokenIndex;
            forSale[_order.asset].length--;
        }
        forSaleIndex[_orderId] = 0;
        orders[_orderId] = Order({
            maker: address(0),
            price: 0,
            amount:0,
            asset: address(0)
        });
        if(userOrders[_order.maker].length > 1){
            tokenIndex = userOrderIndex[_orderId];
            lastTokenIndex = userOrders[_order.maker].length.sub(1);
            lastToken = userOrders[_order.maker][lastTokenIndex];
            userOrders[_order.maker][tokenIndex] = lastToken;
            userOrderIndex[lastToken] = tokenIndex;
        }
        userOrders[_order.maker].length--;
        userOrderIndex[_orderId] = 0;
    }
}