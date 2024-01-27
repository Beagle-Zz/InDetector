contract c13950{
  /**
   * @dev A reference to the sale's token contract. 
   * @return The token contract.
   */
  function getToken() public view returns (ERC20) {
    return sale.token();
  }
}