contract c13382{
    // call from our payment contract
    function placeEMONTBid(address _bidder, uint8 _siteId, uint _bidAmount) requireTokenContract onlyRunning onlyModerators external validEMONTSiteId(_siteId) {
        // check valid bid 
        if (_bidder.isContract()) revert();
        if (_bidAmount < bidEMONTMin) revert();
        uint index = 0;
        totalBid += 1;
        BiddingInfo storage bid = bids[totalBid];
        uint32[] storage siteBids = sites[_siteId];
        if (siteBids.length >= MAX_BID_PER_SITE) {
            // find lowest bid
            uint lowestIndex = 0;
            BiddingInfo storage currentBid = bids[siteBids[0]];
            BiddingInfo storage lowestBid = currentBid;
            for (index = 0; index < siteBids.length; index++) {
                currentBid = bids[siteBids[index]];
                // check no same ether address 
                if (currentBid.bidder == _bidder) {
                    revert();
                }
                if (lowestBid.amount == 0 || currentBid.amount < lowestBid.amount || (currentBid.amount == lowestBid.amount && currentBid.bidId > lowestBid.bidId)) {
                    lowestIndex = index;
                    lowestBid = currentBid;
                }
            }
            // verify bidIncrement
            if (_bidAmount < lowestBid.amount + bidEMONTIncrement)
                revert();
            // update latest bidder
            bid.bidder = _bidder;
            bid.bidId = totalBid;
            bid.amount = _bidAmount;
            bid.time = block.timestamp;
            siteBids[lowestIndex] = totalBid;
            // refund for the lowest 
            ERC20Interface token = ERC20Interface(tokenContract);
            token.transfer(lowestBid.bidder, lowestBid.amount);
        } else {
            for (index = 0; index < siteBids.length; index++) {
                if (bids[siteBids[index]].bidder == _bidder)
                    revert();
            }
            bid.bidder = _bidder;
            bid.bidId = totalBid;
            bid.amount = _bidAmount;
            bid.time = block.timestamp;
            siteBids.push(totalBid);
        }
        EventPlaceBid(_bidder, _siteId, totalBid, _bidAmount);
    }
}