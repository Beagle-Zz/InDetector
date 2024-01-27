contract c2208{
  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(
    address _to
  )
    onlyOwner
    external
    returns (bool)
  {
    uint16 year = _getYear(now);
    require (year >= mintStartYear && year <= mintEndYear && !minted[year]);
    require (_to != address(0));
    totalSupply_ = totalSupply_.add(yearlyMintCap);
    balances[_to] = balances[_to].add(yearlyMintCap);
    minted[year] = true;
    emit Mint(_to, yearlyMintCap);
    emit Transfer(address(0), _to, yearlyMintCap);
    return true;
  }
}