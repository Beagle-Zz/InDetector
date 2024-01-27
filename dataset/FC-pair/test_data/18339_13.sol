contract c18339{
  /**
   * Adjust rewards for `_address`
   */
  function updatePlayerRewards(address _address) internal {
    require(_address != address(0));
    uint256 _reward = 0;
    if (rewards[_address] == 0) {
      _reward = rewardAmount;
    } else if (rewards[_address] < tranche) {
      _reward = trueBuy[_address] * rewardNumerator / rewardDenominator;
    }
    if (_reward > 0) {
      // update rewards record
      rewards[_address] = tranche;
      balances[_address] += _reward;
      allowed[_address][msg.sender] += _reward; // set allowance
      totalSupply += _reward;
      outstandingQuarters += _reward;
      uint256 spentETH = (_reward * (10 ** 18)) / ethRate;
      if (reserveETH >= spentETH) {
          reserveETH -= spentETH;
        } else {
          reserveETH = 0;
        }
      // tranche size change
      _changeTrancheIfNeeded();
      emit Approval(_address, msg.sender, _reward);
      emit Reward(_address, _reward, outstandingQuarters, totalSupply);
    }
  }
}