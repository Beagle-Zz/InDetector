contract c3686{
  // OVERRIDES
  /**
   * @dev Function to mint tokens. Overriden to check for supply cap.
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
    require(totalSupply_.add(_amount) <= SUPPLY_CAP);
    require(super.mint(_to, _amount));
    return true;
  }
}