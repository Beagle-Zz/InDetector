contract c16787{
  /**
   * @dev Token Purchase
   */
  function buyTokens() public payable {
    require(msg.value != 0);
    require(msg.sender != 0);
    require(isICOActive() || postICOSale);
    require(token.whitelist(msg.sender));
    // calculate token amount to be created
    uint256 tokensPurchased;
    uint256 weiChange;
    (tokensPurchased, weiChange) = token.weiToTokens(msg.value);
    uint256 weiExactAmount = msg.value.sub(weiChange);
    require(tokensPurchased >= minimumPurchase);
    // Cannot exceed total allocated supply for the ICO
    // reverting allows a smaller purchase to pass in the future, up to the icoTokenCap
    if (isICOActive() && token.totalSupply().add(tokensPurchased) > icoTokenCap) revert();
    // Update total amount raised from purchases in Wei
    weiRaised = weiRaised.add(weiExactAmount);
    // Issue the tokens
    token.mint(msg.sender, tokensPurchased); // will revert if tokenCap is reached
    emit TokenPurchase(msg.sender, weiExactAmount, tokensPurchased);
    // Process the payment
    wallet.transfer(weiExactAmount);
    msg.sender.transfer(weiChange);
  }
}