contract c10674{
  /**
  * @dev withdraw reward
  * @return {
    "uint256 reward": the new supply
    "uint256 commitmentValue": the commitment to be returned
    }
  */
  function withdraw() public returns (uint256 reward, uint256 commitmentValue) {
    require(miners[msg.sender].value > 0); 
    //will revert if reward is negative:
    reward = getReward(msg.sender);
    Commitment storage commitment = miners[msg.sender];
    commitmentValue = commitment.value;
    uint256 withdrawnSum = commitmentValue.add(reward);
    totalStake_ = totalStake_.sub(commitmentValue);
    totalSupply_ = totalSupply_.add(reward);
    balances[msg.sender] = balances[msg.sender].add(withdrawnSum);
    emit Transfer(address(0), msg.sender, commitmentValue.add(reward));
    delete miners[msg.sender];
    emit Withdraw(msg.sender, reward, commitmentValue);  // solium-disable-line
    return (reward, commitmentValue);
  }
}