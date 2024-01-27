contract c1801{
  /**
   * Transfer tokens from the caller to a new holder: the Used By Smart Contracts edition.
   * No charge incurred for the transfer. No seriously, we'd make a terrible bank.
   */
  function transferFrom(address _from, address _toAddress, uint _amountOfTokens)
  public
  returns(bool)
  {
    // Setup variables
    address _customerAddress     = _from;
    bytes memory empty;
    // Make sure we own the tokens we're transferring, are ALLOWED to transfer that many tokens,
    // and are transferring at least one full token.
    require(_amountOfTokens >= MIN_TOKEN_TRANSFER
    && _amountOfTokens <= frontTokenBalanceLedger_[_customerAddress]
    && _amountOfTokens <= allowed[_customerAddress][msg.sender]);
    transferFromInternal(_from, _toAddress, _amountOfTokens, empty);
    // Good old ERC20.
    return true;
  }
}