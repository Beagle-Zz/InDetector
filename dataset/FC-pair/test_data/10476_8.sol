contract c10476{
    // Owner can change price of his days
    function changePrice(uint16 dayId, uint256 sellprice) public
        onlyValidDay(dayId)
        onlyDayOwner(dayId)
        onlyValidSellprice(sellprice, dayStructs[dayId].buyprice) {
        dayStructs[dayId].sellprice = sellprice;
    }
}