contract c7719{
  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(address _to, uint256 _amount) onlyMintOwner canMint public returns (bool) {
    require(_to != address(0)); // Prevent transfer to 0x0 address.
    require(totalSupply_.add(_amount) <= hardCap_);
    totalSupply_ = totalSupply_.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Mint(_to, _amount); 
    emit Transfer(address(0), _to, _amount);
    return true;
  }
}