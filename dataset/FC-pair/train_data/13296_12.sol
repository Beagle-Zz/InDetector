contract c13296{
  /**
   * @dev Don't allow tokens to be sent to the contract
   */
  modifier rejectTokensToContract(address _to) {
    require(_to != address(this));
    _;
  }
}