contract c1152{
  /**
   * Same as buy, but explicitly sets your dividend percentage.
   * If this has been called before, it will update your `default' dividend
   *   percentage for regular buy transactions going forward.
   */
  function buyAndSetDivPercentage(address _referredBy, uint8 _divChoice, string providedUnhashedPass)
  public
  payable
  returns (uint)
  {
    require(icoPhase || regularPhase);
    if (icoPhase) {
      // Anti-bot measures - not perfect, but should help some.
      bytes32 hashedProvidedPass = keccak256(providedUnhashedPass);
      require(hashedProvidedPass == icoHashedPass || msg.sender == bankrollAddress);
      uint gasPrice = tx.gasprice;
      // Prevents ICO buyers from getting substantially burned if the ICO is reached
      //   before their transaction is processed.
      require(gasPrice <= icoMaxGasPrice && ethInvestedDuringICO <= icoHardCap);
    }
    // Dividend percentage should be a currently accepted value.
    require (validDividendRates_[_divChoice]);
    // Set the dividend fee percentage denominator.
    userSelectedRate[msg.sender] = true;
    userDividendRate[msg.sender] = _divChoice;
    emit UserDividendRate(msg.sender, _divChoice);
    // Finally, purchase tokens.
    purchaseTokens(msg.value, _referredBy);
  }
}