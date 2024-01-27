contract c18067{
  /**
   * @notice Returns a sorted array of the top 100 bidders
   * @return The top 100 bidders, sorted by bid
   */
    function getTopBidders() external view returns (address[100]) {
        address[100] memory tempArray;
        for (uint i = 0; i < 100; ++i) {
            tempArray[i] = _topBids[i].bidderAddress;
        }
        return tempArray;
    }
}