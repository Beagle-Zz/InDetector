contract c2325{
  /**
   * @dev Function to mint tokens
   * @param _to The address that will recieve the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(address _to, uint256 _amount) public returns (bool) {
    if (totalSupply.add(_amount) > MAXIMUM_SUPPLY) {
      return false;
    }
    return super.mint(_to, _amount);
  }
}