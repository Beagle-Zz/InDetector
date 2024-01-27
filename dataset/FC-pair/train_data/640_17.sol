contract c640{
  /**
   * @dev Withdraws all remaining (not sold) tokens from the crowdsale contract
   * @param _to address of tokens receiver
   */
  function withdrawTokens(address _to) public onlyAdmin {
    uint256 amount = token.balanceOf(address(this));
    require(amount > 0, "no tokens on the contract");
    token.transfer(_to, amount);
  }
}