contract c12928{
    /// @dev Completes a siring auction by bidding.
    ///  Immediately breeds the winning matron with the sire on auction.
    /// @param _sireId - ID of the sire on auction.
    /// @param _matronId - ID of the matron owned by the bidder.
    function bidOnSiringAuction(
        uint256 _sireId,
        uint256 _matronId
    )
        external
        payable
        whenNotPaused
    {
        // Auction contract checks input sizes
        require(_owns(msg.sender, _matronId));
        require(isReadyToBreed(_matronId));
        require(_canBreedWithViaAuction(_matronId, _sireId));
        // Define the current price of the auction.
        uint256 currentPrice = siringAuction.getCurrentPrice(_sireId);
        // zhangyong
        // 如果不是0代狗繁殖，则多收0代狗的繁殖收益
        uint256 totalFee = currentPrice + autoBirthFee;
        Dog storage matron = dogs[_matronId];
        if (matron.generation > 0) {
            totalFee += gen0Profit;
        }        
        require(msg.value >= totalFee);
        uint256 auctioneerCut = saleAuction.computeCut(currentPrice);
        // Siring auction will throw if the bid fails.
        siringAuction.bid.value(currentPrice - auctioneerCut)(_sireId, msg.sender);
        _breedWith(uint32(_matronId), uint32(_sireId));
        // zhangyong
        // 额外的钱返还给用户
        uint256 bidExcess = msg.value - totalFee;
        if (bidExcess > 0) {
            msg.sender.transfer(bidExcess);
        }
    }
}