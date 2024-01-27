contract c7066{
  /**
   * Calculate fee for transfer of given number of tokens.
   *
   * @param _amount transfer amount to calculate fee for
   * @return fee for transfer of given amount
   */
  function calculateFee (uint256 _amount)
    public delegatable view returns (uint256 _fee) {
    require (_amount <= MAX_TOKENS_COUNT);
    _fee = safeMul (_amount, variableFeeNumerator) / FEE_DENOMINATOR;
    if (_fee < minVariableFee) _fee = minVariableFee;
    if (_fee > maxVariableFee) _fee = maxVariableFee;
    _fee = safeAdd (_fee, fixedFee);
  }
}