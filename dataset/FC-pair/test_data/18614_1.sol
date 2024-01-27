contract c18614{
  /// @notice The owner can withdraw ethers already during Private Sale,
  function ownerWithdraw(uint256 value) external onlyOwner {
    if (!owner.send(value)) revert();
  }
}