contract c18235{
    // To display on website
    function getRareItemInfo() external constant returns (address[], uint256[]) {
        address[] memory itemOwners = new address[](schema.currentNumberOfRares());
        uint256[] memory itemPrices = new uint256[](schema.currentNumberOfRares());
        uint256 startId;
        uint256 endId;
        (startId, endId) = schema.rareIdRange();
        uint256 i;
        while (startId <= endId) {
            itemOwners[i] = rareItemOwner[startId];
            itemPrices[i] = rareItemPrice[startId];
            i++;
            startId++;
        }
        return (itemOwners, itemPrices);
    }
}