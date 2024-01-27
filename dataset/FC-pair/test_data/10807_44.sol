contract c10807{
  /** Called once by crowdsale finalize() if the sale was success. */
  function finalizeCrowdsale() public {
    assert(msg.sender == address(crowdsale));
    if (token.reservedTokensDestinationsLen() > 0) {
      assert(reservedTokensAreDistributed);
    }
    token.releaseTokenTransfer();
  }
}