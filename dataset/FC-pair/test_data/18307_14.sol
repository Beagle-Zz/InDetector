contract c18307{
  /**
   * @dev Allows the current owner to update a single rate.
   * @param _symbol The symbol to be updated. 
   * @param _rate the rate for the symbol. 
   */
  function updateRate(string _symbol, uint _rate) public onlyOwner {
    rates[keccak256(_symbol)] = _rate;
    emit RateUpdated(now, keccak256(_symbol), _rate);
  }
}