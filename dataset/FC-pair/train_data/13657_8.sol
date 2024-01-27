contract c13657{
  /**
   * @notice Return the total supply of the token
   * @dev This function is part of the ERC20 standard
   * @return The token supply
   */
  function totalSupply() public constant returns (uint) {
    return _totalSupply;
  }
}