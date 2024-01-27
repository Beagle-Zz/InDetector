contract c16787{
  /**
   * @dev Token Purchase outside of this contract, usually paid for by currencies other than ETH
   * @dev Only the owner of this contract can issue tokens in exchange for payments in other currencies
   * @param _beneficiary the address which receives the tokens
   * @param _currency currency symbol
   * @param _value amount paid in the given currency.  It must be in whole units, so currencies like MicroUSD (millionth of a US$) should be used
   * @param _txid the transaction ID of the external deposit.  Could be a Bitcoin Transaction Hash or Wire Transfer Reference Number.
   * @param _amount amount of tokens purchased
   */
  function externalPurchase(address _beneficiary, string _currency, uint256 _value, uint256 _amount, uint256 _txid) public {
    require(owner != address(0));
    require(msg.sender == owner); //  Only owner can issue tokens in exchange for external payment
    require(isICOActive() || postICOSale);
    require(token.whitelist(_beneficiary));
    require(_amount >= minimumPurchase);
    // Cannot exceed total allocated supply for the ICO
    // reverting allows a smaller purchase to pass in the future, up to the icoTokenCap
    if (isICOActive() && token.totalSupply().add(_amount) > icoTokenCap) revert();
    // Update total amount raised from purchases via external sales
    externalFundsRaised[currencyToHash(_currency)] = externalFundsRaised[currencyToHash(_currency)].add(_value);
    // Issue the tokens
    token.mint(_beneficiary, _amount); // will revert if tokenCap is reached
    emit ExternalTokenPurchase(_beneficiary, _currency, _value, _amount, _txid);
  }
}