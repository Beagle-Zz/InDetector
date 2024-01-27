contract c8308{
  /**
   * @dev Claim reward collected through your affiliates
   */
  function claimReward() public {
    if (affiliates[msg.sender] > 0) {
      require(tkn.transfer(msg.sender, affiliates[msg.sender]));
      affiliates[msg.sender] = 0;
    }
  }
}