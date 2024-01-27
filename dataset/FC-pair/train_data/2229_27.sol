contract c2229{
  /*
    @param _wallet - wallet address wanted to check
    @return amount of releasable token
  */
  function releasableAmount(address _wallet) public view returns (uint256) {
    Vesting memory vesting = vestingMap[_wallet];
    return vestedAmount(_wallet).sub(vesting.released);
  }
}