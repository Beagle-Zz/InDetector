contract c16923{
    // @dev just cancel auction.
    function _cancelActiveAuction(uint40 _cutieId, address _seller) internal
    {
        _removeAuction(_cutieId);
        _transfer(_seller, _cutieId);
        emit AuctionCancelled(_cutieId);
    }
}