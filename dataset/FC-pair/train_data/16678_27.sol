contract c16678{
  /// @dev This function is prototyped in Recoverable contract
  function tokensToBeReturned(ERC20Basic tokenToClaim) public returns (uint) {
    if (address(tokenToClaim) == address(token)) {
      return getBalance().minus(tokensAllocatedTotal);
    } else {
      return tokenToClaim.balanceOf(this);
    }
  }
}