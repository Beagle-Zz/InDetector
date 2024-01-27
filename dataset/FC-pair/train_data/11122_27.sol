contract c11122{
    /**
   * @dev Trade balances of given tokens amounts between two users.
   * @param tokenGet   address
   * @param amountGet  uint256
   * @param tokenGive  address
   * @param amountGive uint256
   * @param user       address
   * @param amount     uint256
   */
  function tradeBalances(
    address tokenGet,
    uint256 amountGet,
    address tokenGive,
    uint256 amountGive,
    address user,
    uint256 amount
  )
    private
  {
    // Calculate the constant taxes.
    uint256 feeMakeXfer = amount.mul(feeMake).div(1 ether);
    uint256 feeTakeXfer = amount.mul(feeTake).div(1 ether);
    uint256 feeRebateXfer = 0;
    // Calculate the tax according to account level.
    if (accountLevelsAddr != 0x0) {
      uint256 accountLevel = AccountLevels(accountLevelsAddr).accountLevel(user);
      if (accountLevel == 1) {
        feeRebateXfer = amount.mul(feeRebate).div(1 ether);
      } else if (accountLevel == 2) {
        feeRebateXfer = feeTakeXfer;
      }
    }
    // Update the balances for both maker and taker and add the fee to the feeAccount.
    tokens[tokenGet][msg.sender] = tokens[tokenGet][msg.sender].sub(amount.add(feeTakeXfer));
    tokens[tokenGet][user] = tokens[tokenGet][user].add(amount.add(feeRebateXfer).sub(feeMakeXfer));
    tokens[tokenGet][feeAccount] = tokens[tokenGet][feeAccount].add(feeMakeXfer.add(feeTakeXfer).sub(feeRebateXfer));
    tokens[tokenGive][user] = tokens[tokenGive][user].sub(amountGive.mul(amount).div(amountGet));
    tokens[tokenGive][msg.sender] = tokens[tokenGive][msg.sender].add(amountGive.mul(amount).div(amountGet));
  }
}