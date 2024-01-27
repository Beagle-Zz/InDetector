contract c2693{
  /**
   * @dev Throws if called by any account other than the owner or admin.
   */
  modifier onlyOwnerOrAdmin() {
    require(
      msg.sender == adminAddress ||
      msg.sender == ownerAddress
    );
    _;
  }
}