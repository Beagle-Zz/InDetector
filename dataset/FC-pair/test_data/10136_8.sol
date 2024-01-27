contract c10136{
  // ------------------------------------------------------------------------
  // Function to mint tokens within the cap limit
  // @param _to The address that will receive the minted tokens.
  // @param _amount The amount of tokens to mint.
  // @return A boolean that indicates if the operation was successful.
  // ------------------------------------------------------------------------
  function mint(address _to, uint256 _amount) hasMintPermission canMint public returns (bool) {
    require(_amount <= batchlimits);
    require(_totalSupply.add(_amount) <= cap);
    _totalSupply = _totalSupply.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Mint(_to, _amount);
    emit Transfer(address(0), _to, _amount);
    return true;
  }
}