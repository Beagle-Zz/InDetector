contract c608{
  // ------------------------------------------------------------------------
  // Total supply
  // ------------------------------------------------------------------------
  function totalSupply() public view returns (uint256) {
    return _totalSupply.sub(balances[address(0)]);
  }
}