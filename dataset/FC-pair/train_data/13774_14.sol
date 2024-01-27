contract c13774{
  /**
   * @dev Function to convert {Set} Tokens into underlying components
   *
   * The ERC20 components do not need to be approved to call this function
   *
   * @param _quantity uint The quantity of Sets desired to redeem in Wei as a multiple of naturalUnit
   */
  function redeem(uint _quantity)
    public
    isMultipleOfNaturalUnit(_quantity)
    hasSufficientBalance(_quantity)
    isNonZero(_quantity)
    returns (bool success)
  {
    burn(_quantity);
    for (uint16 i = 0; i < components.length; i++) {
      address currentComponent = components[i].address_;
      uint currentUnits = components[i].unit_;
      uint preTransferBalance = ERC20(currentComponent).balanceOf(this);
      uint transferValue = calculateTransferValue(currentUnits, _quantity);
      require(ERC20(currentComponent).transfer(msg.sender, transferValue));
      // Check that preTransferBalance + transfer value is the same as postTransferBalance
      uint postTransferBalance = ERC20(currentComponent).balanceOf(this);
      assert(preTransferBalance.sub(transferValue) == postTransferBalance);
    }
    emit LogRedemption(msg.sender, _quantity);
    return true;
  }
}