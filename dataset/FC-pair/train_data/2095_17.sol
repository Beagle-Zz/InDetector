contract c2095{
  // query the lowest price
  function queryCurrentTradablePrice() external view returns (uint256 token_id,uint256 price) {
    if (stTokens.length < ISSUE_MAX){
      token_id = stTokens.length;
      price = START_PRICE;
    } else {
      token_id = _getCurrentTradableToken();
      price = stTokens[token_id].price;
    }
  }
}