contract c18994{
  /// @dev Gets the price and buy cap for individual addresses at the given milestone index
  /// @param self Stored Crowdsale from crowdsale contract
  /// @param timestamp Time during sale for which data is requested
  /// @return A 2-element array with 0 the timestamp, 1 the price in eth
  function getSaleData(DirectCrowdsaleStorage storage self, uint256 timestamp)
                       public
                       view
                       returns (uint256[2])
  {
    uint256[2] memory _thisData;
    uint256 index;
    while((index < self.milestoneTimes.length) && (self.milestoneTimes[index] < timestamp)) {
      index++;
    }
    if(index == 0)
      index++;
    _thisData[0] = self.milestoneTimes[index - 1];
    _thisData[1] = self.tokenPrice[_thisData[0]];
    return _thisData;
  }
}