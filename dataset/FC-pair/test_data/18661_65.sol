contract c18661{
  // @dev Get the deposit of gold of the player.
  function getGoldDepositOfAddress(address _address)
    external view
    returns (uint256)
  {
    return addressToGoldDeposit[_address];
  }
}