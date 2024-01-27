contract c1899{
    // @dev create and start a new auction
    // @param _cutieId - ID of cutie to auction, sender must be owner.
    // @param _startPrice - Price of item (in wei) at the beginning of auction.
    // @param _endPrice - Price of item (in wei) at the end of auction.
    // @param _duration - Length of auction (in seconds).
    // @param _seller - Seller
    function createAuction(
        uint40 _cutieId,
        uint128 _startPrice,
        uint128 _endPrice,
        uint40 _duration,
        address _seller
    )
        public
        payable
    {
        require(msg.sender == address(coreContract));
        _escrow(_seller, _cutieId);
        bool allowTokens = _duration < 0x8000000000; // first bit of duration is boolean flag (1 to disable tokens)
        _duration = _duration % 0x8000000000; // clear flag from duration
        Auction memory auction = Auction(
            _startPrice,
            _endPrice,
            _seller,
            _duration,
            uint40(now),
            uint128(msg.value),
            allowTokens
        );
        _addAuction(_cutieId, auction);
    }
}