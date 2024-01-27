contract c10226{
  /**
   * @dev Get the current auditor address from storage.
   */
  function auditor() public view returns (address) {
    return rocketStorage.getAddress(keccak256("token.auditor"));
  }
}