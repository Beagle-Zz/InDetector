contract c16921{
    /// @dev Completes a breeding auction by bidding.
    ///  Immediately breeds the winning mom with the dad on auction.
    /// @param _dadId - ID of the dad on auction.
    /// @param _momId - ID of the mom owned by the bidder.
    function bidOnBreedingAuction(
        uint40 _dadId,
        uint40 _momId
    )
        public
        payable
        whenNotPaused
        returns (uint256)
    {
        // Auction contract checks input sizes
        require(_isOwner(msg.sender, _momId));
        require(canBreed(_momId));
        require(_canMateViaMarketplace(_momId, _dadId));
        // Take breeding fee
        uint256 fee = getBreedingFee(_momId, _dadId);
        require(msg.value >= fee);
        // breeding auction will throw if the bid fails.
        breedingMarket.bid.value(msg.value - fee)(_dadId);
        return _breedWith(_momId, _dadId);
    }
}