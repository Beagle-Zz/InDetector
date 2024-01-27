contract c11178{
  /**
  * @dev Withdraw anyone's creator balance.
  * @param _beneficiary The person whose balance shall be sent to them.
  */
  function withdrawBalance(address _beneficiary) external {
    uint256 payout = creatorBalances[_beneficiary];
    creatorBalances[_beneficiary] = 0;
    _beneficiary.transfer(payout);
    endingBalance = address(this).balance;
  }
}