contract c10871{
  // ------------------------------------------------------------------------------------------ //
  // MODIFIERS / CONSTRUCTOR
  // ------------------------------------------------------------------------------------------ //
  /**
   * @dev This modifier checks that only the creator of the contract can call this smart contract
   */
  modifier onlyIfCreator {
    if (msg.sender == creator) _;
  }
}