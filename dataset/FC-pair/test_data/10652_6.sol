contract c10652{
  /// @dev Set fee percent for Carboneum team.
  function setFee(uint _fee) external onlyOwner {
    fee = _fee;
  }
}