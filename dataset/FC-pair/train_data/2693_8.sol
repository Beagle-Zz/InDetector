contract c2693{
  /**
   * @dev Returns the number of tokens owned by a specific address.
   * @param _owner The owner address to check
   */
  function balanceOf(address _owner) public view returns (uint256 count) {
    return ownershipTokenCount[_owner];
  }
}