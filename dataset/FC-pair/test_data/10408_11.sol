contract c10408{
  /**
   * @dev Approve of minting `_amount` tokens that are assigned to `_owner`
   * @param _owner The address that will be assigned the new tokens
   * @param _amount The quantity of tokens approved of mintting
   * @return True if the tokens are approved of mintting correctly
   */
  function approveMintTokens(address _owner, uint256 _amount) nonZeroAddress(_owner) canMint only(ifoodCommunity) public returns (bool) {
    require(_amount > 0);
    uint256 previousLockTokens = lockTokens[_owner].value;
    require(previousLockTokens + _amount >= previousLockTokens);
    uint256 curTotalSupply = totalSupply;
    require(curTotalSupply + _amount >= curTotalSupply); // Check for overflow
    require(curTotalSupply + _amount <= totalSupplyCap);  // Check for overflow of total supply cap
    uint256 previousBalanceTo = balanceOf(_owner);
    require(previousBalanceTo + _amount >= previousBalanceTo); // Check for overflow
    lockTokens[_owner].value = previousLockTokens.add(_amount);
    uint256 curBlockNumber = getCurrentBlockNumber();
    lockTokens[_owner].blockNumber = curBlockNumber.add(durationOfLock);
    ApproveMintTokens(_owner, _amount);
    return true;
  }
}