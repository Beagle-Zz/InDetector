contract c2454{
  /**
   * @dev Burns a specific amount of tokens.
   * @param _from The address that will burn the tokens.
   * @param _unitAmount The amount of token to be burned.
   */
  function burn(address _from, uint256 _unitAmount) onlyOwner public {
    require(_unitAmount > 0
            && balanceOf(_from) >= _unitAmount);
    balances[_from] = SafeMath.sub(balances[_from], _unitAmount);
    totalSupply = SafeMath.sub(totalSupply, _unitAmount);
    Burn(_from, _unitAmount);
  }
}