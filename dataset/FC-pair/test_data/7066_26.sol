contract c7066{
  /**
   * Set fee parameters.
   *
   * @param _fixedFee fixed fee in token units
   * @param _minVariableFee minimum variable fee in token units
   * @param _maxVariableFee maximum variable fee in token units
   * @param _variableFeeNumerator variable fee numerator
   */
  function setFeeParameters (
    uint256 _fixedFee,
    uint256 _minVariableFee,
    uint256 _maxVariableFee,
    uint256 _variableFeeNumerator) public delegatable payable {
    require (msg.sender == owner);
    require (_minVariableFee <= _maxVariableFee);
    require (_variableFeeNumerator <= MAX_FEE_NUMERATOR);
    fixedFee = _fixedFee;
    minVariableFee = _minVariableFee;
    maxVariableFee = _maxVariableFee;
    variableFeeNumerator = _variableFeeNumerator;
    FeeChange (
      _fixedFee, _minVariableFee, _maxVariableFee, _variableFeeNumerator);
  }
}