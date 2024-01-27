contract c10234{
  // ------------------------------------------------------------------------
  // Accept ethers from one account for tokens to be created for another
  // account. Can be used by exchanges to purchase tokens on behalf of
  // it's user
  // ------------------------------------------------------------------------
  function proxyPayment(address participant) public payable {
    require(participant != address(0x0));
    uint nowTime = getNow();
    require(nowTime >= startDate && nowTime <= endDate);
    require(isInWhitelist(msg.sender));
    require(isInWhitelist(participant));
    uint weiRaised = msg.value;
    require(weiRaised >= CONTRIBUTIONS_MIN);
    uint tokens = TOKEN_PER_ETHER.mul(weiRaised);
    crowsaleShare = crowsaleShare.add(tokens);
    require(crowsaleShare <= TOKENS_CAP_ICO);
    weiBalances[participant] = weiBalances[participant].add(weiRaised);
    balances[participant] = balances[participant].add(tokens);
    balances[wallet] = balances[wallet].sub(tokens);
    wallet.transfer(weiRaised);
    TokenPurchase(wallet, msg.sender, participant, weiRaised, tokens);
  }
}