contract c11122{
  /**
   * @dev Check the balance of the given user in the given token.
   * @param token address Address of the token contract
   * @param user  address Address of the user whom balance will be queried
   */
  function balanceOf(address token, address user)
    public
    constant
    returns (uint256)
  {
    return tokens[token][user];
  }
}