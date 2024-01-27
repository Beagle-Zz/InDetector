contract c12929{
    /// @dev Computes the price and transfers winnings.
    /// Does NOT transfer ownership of token.
    function _bid(uint256 _tokenId, uint256 _bidAmount, address _to)
        internal
        returns (uint256)
    {
        // Get a reference to the auction struct
        Auction storage auction = tokenIdToAuction[_tokenId];
        // Explicitly check that this auction is currently live.
        // (Because of how Ethereum mappings work, we can't just count
        // on the lookup above failing. An invalid _tokenId will just
        // return an auction object that is all zeros.)
        require(_isOnAuction(auction));
        // Check that the bid is greater than or equal to the current price
        uint256 price = _currentPrice(auction);
        uint256 auctioneerCut = computeCut(price);
        //zhangyong
        //两只创世狗每次交易需要收取10%的手续费
        //创世狗无法繁殖，所以只有创世狗交易才会进入到这个方法
        uint256 fee = 0;
        if (_tokenId == 0 || _tokenId == 1) {
            fee = price / 5;
        }        
        require((_bidAmount + auctioneerCut + fee) >= price);
        // Grab a reference to the seller before the auction struct
        // gets deleted.
        address seller = auction.seller;
        // The bid is good! Remove the auction before sending the fees
        // to the sender so we can't have a reentrancy attack.
        _removeAuction(_tokenId);
        // Transfer proceeds to seller (if there are any!)
        if (price > 0) {
            // Calculate the auctioneer's cut.
            // (NOTE: _computeCut() is guaranteed to return a
            // value <= price, so this subtraction can't go negative.)
            uint256 sellerProceeds = price - auctioneerCut - fee;
            // NOTE: Doing a transfer() in the middle of a complex
            // method like this is generally discouraged because of
            // reentrancy attacks and DoS attacks if the seller is
            // a contract with an invalid fallback function. We explicitly
            // guard against reentrancy attacks by removing the auction
            // before calling transfer(), and the only thing the seller
            // can DoS is the sale of their own asset! (And if it's an
            // accident, they can call cancelAuction(). )
            seller.transfer(sellerProceeds);
        }
        // Calculate any excess funds included with the bid. If the excess
        // is anything worth worrying about, transfer it back to bidder.
        // NOTE: We checked above that the bid amount is greater than or
        // equal to the price so this cannot underflow.
        // zhangyong
        // _bidAmount在进入这个方法之前已经扣掉了fee，所以买者需要加上这笔费用才等于开始出价
        // uint256 bidExcess = _bidAmount + fee - price;
        // Return the funds. Similar to the previous transfer, this is
        // not susceptible to a re-entry attack because the auction is
        // removed before any transfers occur.
        // zhangyong
        // msg.sender是主合约地址，并不是出价人的地址
        // msg.sender.transfer(bidExcess);
        // Tell the world!
        AuctionSuccessful(_tokenId, price, _to);
        return price;
    }
}