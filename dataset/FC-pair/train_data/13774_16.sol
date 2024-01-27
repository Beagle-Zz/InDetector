contract c13774{
  /**
   * @dev Function to withdraw tokens that have previously been excluded when calling
   * the partialRedeem method
   * The mask can be computed by summing the powers of 2 of indexes of components to redeem.
   * For example, to redeem the 0th, 1st, and 3rd components, we pass in the hex of
   * 1 + 2 + 8 = 11, padded to length 32 i.e. 0x000000000000000000000000000000000000000000000000000000000000000b
   *
   * @param _componentsToRedeem bytes32 Hex of bitmask of components to redeem
   */
  function redeemExcluded(bytes32 _componentsToRedeem)
    public
    returns (bool success)
  {
    require(_componentsToRedeem > 0, "Components to redeem must be non-zero");
    for (uint16 i = 0; i < components.length; i++) {
      if (_componentsToRedeem & bytes32(2 ** i) > 0) {
        address currentComponent = components[i].address_;
        uint remainingBalance = unredeemedBalances[i][msg.sender];
        // To prevent re-entrancy attacks, decrement the user's Set balance
        unredeemedBalances[i][msg.sender] = 0;
        require(ERC20(currentComponent).transfer(msg.sender, remainingBalance));
      }
    }
    emit LogRedeemExcluded(msg.sender, _componentsToRedeem);
    return true;
  }
}