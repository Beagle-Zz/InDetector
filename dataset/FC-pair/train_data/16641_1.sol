contract c16641{
  /**
   * @dev Burns a specific amount of tokens.
   * @param _value The amount of token to be burned.
   */
  function burnTokens(uint256 _value) public onlyOwner {
      token.burn(_value);
  }
}