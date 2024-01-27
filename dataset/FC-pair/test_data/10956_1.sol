contract c10956{
  /**
   * @dev called by the owner to change the rate of the crowdsale
   */
  function changeRate(uint256 _rate) public onlyOwner {
    rate = _rate;
  }
}