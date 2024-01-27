contract c18888{
  /**
   * @notice Transfers vested tokens to beneficiary.
   */
  function release() onlyBeneficiary public {
    require(now >= cliff);
    _releaseTo(beneficiary);
  }
}