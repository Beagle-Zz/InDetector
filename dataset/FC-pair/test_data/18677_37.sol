contract c18677{
  /// @dev This is invoked once for every pre-ICO address, set pricePerToken
  ///      to 0 to disable
  /// @param preicoAddress PresaleFundCollector address
  /// @param pricePerToken How many weis one token cost for pre-ico investors
  function setPreicoAddress(address preicoAddress, uint pricePerToken)
    public
    onlyOwner
  {
    preicoAddresses[preicoAddress] = pricePerToken;
  }
}