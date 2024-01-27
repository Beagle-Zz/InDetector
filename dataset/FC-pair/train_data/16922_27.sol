contract c16922{
    // @dev Launches and starts a new auction.
    function createAuction(
        uint40 _cutieId,
        uint128 _startPrice,
        uint128 _endPrice,
        uint40 _duration,
        address _seller)
        public payable
    {
        require(msg.sender == address(coreContract));
        _escrow(_seller, _cutieId);
        Auction memory auction = Auction(
            _startPrice,
            _endPrice,
            _seller,
            _duration,
            uint40(now),
            uint128(msg.value)
        );
        _addAuction(_cutieId, auction);
    }
}