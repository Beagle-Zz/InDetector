contract c7620{
  /**
   * @dev called by the owner to start the crowdsale
   */
  function start() public onlyOwner {
    openingTime = now;
    closingTime =  now + duration;
  }
}