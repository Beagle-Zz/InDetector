contract c18719{
  //token amount calculation
  function calculateTokenAmount(uint weiAmount, address receiver) internal view returns (uint weiAllowed, uint tokenAmount) {
    //Divided by 1000 because eth eth_price_in_eurs is multiplied by 1000
    uint tokensPerEth = getCurrentPrice(tokensSold).mul(milieurs_per_eth).div(1000);
    uint maxWeiAllowed = sellable_tokens.sub(tokensSold).mul(1 ether).div(tokensPerEth);
    weiAllowed = maxWeiAllowed.min256(weiAmount);
    if (weiAmount < maxWeiAllowed) {
      tokenAmount = tokensPerEth.mul(weiAmount).div(1 ether);
    }
    // With this case we let the crowdsale end even when there are rounding errors due to the tokens to wei ratio
    else {
      tokenAmount = sellable_tokens.sub(tokensSold);
    }
    // Require a minimum contribution of 100 fulltokens
    require(token.balanceOf(receiver).add(tokenAmount) >= minimum_buy_value);
  }
}