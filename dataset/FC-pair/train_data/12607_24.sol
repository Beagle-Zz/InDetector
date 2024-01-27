contract c12607{
  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(
    address _to,
    uint256 _amount
  )
    onlyOracle
    canMint
    public
    returns (bool)
  {
    _amount = _amount*10**uint256(decimals);
    require(totalSupply_.add(_amount) <= cap);
    return super.mint(_to, _amount);
  }
}