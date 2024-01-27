contract c10226{
  /**
   * @dev Get the current depository address from storage.
   */
  function depository() public view returns (address) {
    return rocketStorage.getAddress(keccak256("token.depository"));
  }
}