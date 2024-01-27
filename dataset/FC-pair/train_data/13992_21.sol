contract c13992{
  /**
   * @dev Sell tokens to msg.sender
   *
   */
  function sellTokens() public payable beginSaleActive {
    require(msg.value > 0);
    uint256 amount = msg.value;
    uint256 tokens = amount.mul(rate);
    // check there are tokens for sale;
    require(tokens <= balances[PRESALE_ADDRESS]);
    if (saleAction == PresaleAction.FirstPresaleActivity){
      // The maximum amount of single users for presales in the first period is 20,000.
      require (tokens <= CAT_FIRST);
    }
    // send tokens to buyer
    _distribute(msg.sender, tokens, lockCycle, DURATION);
    balances[PRESALE_ADDRESS] = balances[PRESALE_ADDRESS].sub(tokens);
    emit Transfer(PRESALE_ADDRESS, msg.sender, tokens);
    emit SellTokens(msg.sender, tokens, rate);
    forwardFunds();
  }
}