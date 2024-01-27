contract c2454{
  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _unitAmount The amount of tokens to mint.
   */
  function mint(address _to, uint256 _unitAmount) onlyOwner canMint public returns (bool) {
    require(_unitAmount > 0);
    totalSupply = SafeMath.add(totalSupply, _unitAmount);
    balances[_to] = SafeMath.add(balances[_to], _unitAmount);
    Mint(_to, _unitAmount);
    Transfer(address(0), _to, _unitAmount);
    return true;
  }
}