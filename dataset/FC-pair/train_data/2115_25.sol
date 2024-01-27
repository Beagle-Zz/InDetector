contract c2115{
  /**
   * @dev Checks escrow wallet balance
   */
  function escrowBalance() public view returns (uint256) {
    return address(escrow).balance;
  }
}