contract c13779{
  ///////////////////////////////////////////////////////////
  /// Set Functions
  ///////////////////////////////////////////////////////////
  /**
   * @dev Function to convert component into {Set} Tokens
   *
   * Please note that the user's ERC20 component must be approved by
   * their ERC20 contract to transfer their components to this contract.
   *
   * @param _quantity uint The quantity of Sets desired to issue in Wei as a multiple of naturalUnit
   */
  function issue(uint _quantity)
    isMultipleOfNaturalUnit(_quantity)
    isNonZero(_quantity)
    public returns (bool success) {
    // Transfers the sender's components to the contract
    // Since the component length is defined ahead of time, this is not
    // an unbounded loop
    for (uint16 i = 0; i < components.length; i++) {
      address currentComponent = components[i].address_;
      uint currentUnits = components[i].unit_;
      uint preTransferBalance = ERC20(currentComponent).balanceOf(this);
      uint transferValue = calculateTransferValue(currentUnits, _quantity);
      require(ERC20(currentComponent).transferFrom(msg.sender, this, transferValue));
      // Check that preTransferBalance + transfer value is the same as postTransferBalance
      uint postTransferBalance = ERC20(currentComponent).balanceOf(this);
      assert(preTransferBalance.add(transferValue) == postTransferBalance);
    }
    mint(_quantity);
    emit LogIssuance(msg.sender, _quantity);
    return true;
  }
}