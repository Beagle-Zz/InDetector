contract c12098{
    // returns next minimal bid or final bid on auctions that already end
    function getRegionPrice(uint16 regionId) public view returns (uint256 next_bid) {
        if(regions[regionId].owner != address(0)) {
            return region_bids[regionId].bid;
        }
        if (region_bids[regionId].currentBuyer != address(0)) {//If have bid already
            next_bid = region_bids[regionId].bid + MINIMAL_RAISE;
        } else {
            next_bid = regions[regionId].startPrice;
        }
    }
}