contract c16922{
    // @dev Returns true if the token is on auction.
    // @param _auction - Auction to check.
    function _isOnAuction(Auction storage _auction) internal view returns (bool)
    {
        return (_auction.startedAt > 0);
    }
}