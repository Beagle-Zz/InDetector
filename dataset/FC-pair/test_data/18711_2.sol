contract c18711{
    // the price is per 10^decimals tokens 
    function PlaceSellOrder(uint256 amount, uint256 price) public {
        require(price > 0);
        require(balanceOf[msg.sender] >= amount);
        SellOrders[msg.sender] = [amount, price];
        emit SellOrderPlaced(msg.sender, amount, price);
    }
}