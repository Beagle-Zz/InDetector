contract c2229{
  /*
    @param _wallet - wallet address wanted to check
    @return amount of token allocated
  */
  function allocationOf(address _wallet) public view returns (uint256) {
    Vesting memory vesting = vestingMap[_wallet];
    return vesting.amount;
  }
}