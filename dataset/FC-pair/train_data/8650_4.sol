contract c8650{
	// max auction time for token is 7 days..
    function _isAuctionAble(uint256 _timestamp) internal view returns(bool)
    {
       return (_timestamp + constantTime >= now);
    }
}