contract c8284{
  /**
   * @dev Prepare sell of the tokens
   * @param _investor Investors address
   * @param _amount Amount invested
   */
  function prepareSell(address _investor, uint256 _amount) private {
    uint256 remaining;
    uint256 pricePerCent;
    uint256 pricePerToken;
    uint256 toSell;
    uint256 amount = _amount;
    uint256 sellInWei;
    address investor = _investor;
    pricePerCent = getUSDPrice();
    pricePerToken = pricePerCent.mul(tokenPrice[currentLevel]); // calculate the price for each token in the current level
    toSell = _amount.div(pricePerToken); // calculate the amount to sell
    if (toSell < levelTokens) { // if there is enough tokens left in the current level, sell from it
      levelTokens = levelTokens.sub(toSell);
      weiRised = weiRised.add(_amount);
      executeSell(investor, toSell, _amount);
      owner.transfer(_amount);
    } else { // if not, sell from 2 or more different levels
      while (amount > 0) {
        if (toSell > levelTokens) {
          toSell = levelTokens; // sell all the remaining in the level
          sellInWei = toSell.mul(pricePerToken);
          amount = amount.sub(sellInWei);
          if (currentLevel < 11) { // if is the last level, sell only the tokens left,
            currentLevel += 1;
            levelTokens = baseTokens;
          } else {
            remaining = amount;
            amount = 0;
          }
        } else {
          sellInWei = amount;
          amount = 0;
        }
        executeSell(investor, toSell, sellInWei); 
        weiRised = weiRised.add(sellInWei);
        owner.transfer(amount);
        if (amount > 0) {
          toSell = amount.div(pricePerToken);
        }
        if (remaining > 0) { // if there is any mount left, it means that is the the last level an there is no more tokens to sell
          investor.transfer(remaining);
          owner.transfer(address(this).balance);
          presaleEnded = true;
        }
      }
    }
  }
}