contract c10956{
  /**
   * @dev called by the owner to start the crowdsale
   */
  function start(uint256 _duration) public onlyOwner {
    duration = _duration;
    openingTime = now;
    closingTime =  now + duration;
  }
}