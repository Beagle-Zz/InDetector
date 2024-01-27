contract c18660{
  // @dev Add deposit.
  //  This is intended to be called by Dungeon, Arena, Guild contracts.
  function addDeposit(address _to, uint256 _amount)
    onlyAccessDeposit
    public
  {
    // Increment deposit.
    addressToGoldDeposit[_to] += _amount;
  }
}