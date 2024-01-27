contract c13774{
  /**
   * @dev Function to withdraw a portion of the component tokens of a Set
   *
   * This function should be used in the event that a component token has been
   * paused for transfer temporarily or permanently. This allows users a
   * method to withdraw tokens in the event that one token has been frozen.
   *
   * The mask can be computed by summing the powers of 2 of indexes of components to exclude.
   * For example, to exclude the 0th, 1st, and 3rd components, we pass in the hex of
   * 1 + 2 + 8 = 11, padded to length 32 i.e. 0x000000000000000000000000000000000000000000000000000000000000000b
   *
   * @param _quantity uint The quantity of Sets desired to redeem in Wei
   * @param _componentsToExclude bytes32 Hex of bitmask of components to exclude
   */
  function partialRedeem(uint _quantity, bytes32 _componentsToExclude)
    public
    isMultipleOfNaturalUnit(_quantity)
    isNonZero(_quantity)
    hasSufficientBalance(_quantity)
    returns (bool success)
  {
    // Excluded tokens should be less than the number of components
    // Otherwise, use the normal redeem function
    require(_componentsToExclude > 0, "Excluded components must be non-zero");
    burn(_quantity);
    for (uint16 i = 0; i < components.length; i++) {
      uint transferValue = calculateTransferValue(components[i].unit_, _quantity);
      // Exclude tokens if 2 raised to the power of their indexes in the components
      // array results in a non zero value following a bitwise AND
      if (_componentsToExclude & bytes32(2 ** i) > 0) {
        unredeemedBalances[i][msg.sender] += transferValue;
      } else {
        uint preTransferBalance = ERC20(components[i].address_).balanceOf(this);
        require(ERC20(components[i].address_).transfer(msg.sender, transferValue));
        // Check that preTransferBalance + transfer value is the same as postTransferBalance
        uint postTransferBalance = ERC20(components[i].address_).balanceOf(this);
        assert(preTransferBalance.sub(transferValue) == postTransferBalance);
      }
    }
    emit LogPartialRedemption(msg.sender, _quantity, _componentsToExclude);
    return true;
  }
}