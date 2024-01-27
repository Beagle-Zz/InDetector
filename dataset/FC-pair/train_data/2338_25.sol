contract c2338{
  /**
   * @dev Executes buyback
   * @dev burns all allowed tokens and returns back Eth
   * @dev call token.approve before calling this function
   */
  function buyback() public {
    require(getStage(sold) > 0, "buyback doesn't work on stage 0");
    uint256 approved = token.allowance(msg.sender, this);
    uint256 inCirculation = token.totalSupply().sub(token.balanceOf(this));
    uint256 value = approved.mul(this.balance).div(inCirculation);
    token.burnFrom(msg.sender, approved);
    msg.sender.send(value);
    emit Buyback(msg.sender, approved, value);
  }
}