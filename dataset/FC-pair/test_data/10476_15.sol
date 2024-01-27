contract c10476{
    // Returns the price the day currently can be bought for
    function getCurrentPrice(uint16 dayId) private view
    returns (uint256 currentPrice) {
        return hasOwner(dayId) ?
            dayStructs[dayId].sellprice :
            initialDayPrice;
    }
}