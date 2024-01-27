contract c13657{
  /**
   * @notice Get the token balance of `tokenOwner`
   * @dev This function is part of the ERC20 standard
   * @param tokenOwner The wallet to get the balance of
   * @return {"balance": "The balance of `tokenOwner`"}
   */
  function balanceOf(
    address tokenOwner
  )
  public constant returns (uint balance)
  {
    return balances[tokenOwner];
  }
}