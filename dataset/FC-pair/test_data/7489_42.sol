contract c7489{
  /// @dev Sets the crowdsale address to allow authorize locking permissions
  /// @param _crowdsale The address of the crowdsale
  function setCrowdsaleAddress (address _crowdsale)
    public
    onlyOwner
    returns (bool)
  {
    crowdsale = OMICrowdsale(_crowdsale);
    require(crowdsale.isOMICrowdsaleContract());
    return true;
  }
}