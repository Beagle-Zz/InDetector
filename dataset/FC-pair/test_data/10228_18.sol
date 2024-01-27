contract c10228{
  /**
   * @dev Returns the rate of tokens per wei at the present time. 
   * @return The number of tokens a buyer gets per wei at a given time
   */
  function setCurrentRate(uint256 _newRate) public onlyOwner returns (uint256) {
    require(_newRate > 0); 
    uint256 oldRate_ = rate;
    rate = _newRate;
    emit RateUpdated(oldRate_, rate);
  }
}