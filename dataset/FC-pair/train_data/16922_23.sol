contract c16922{
    // @dev Returns auction info for a token on auction.
    // @param _cutieId - ID of token on auction.
    function isOnAuction(uint40 _cutieId)
        public
        view
        returns (bool) 
    {
        return cutieIdToAuction[_cutieId].startedAt > 0;
    }
}