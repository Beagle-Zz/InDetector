contract c2095{
  // buy (only accept normal address)
  function buy(uint256 next_price, bool is_recommend, uint256 recommend_token_id) external payable mustCommonAddress {
    require (next_price >= PRICE_MIN && next_price <= PRICE_LIMIT);
    _checkRecommend(is_recommend,recommend_token_id);
    if (stTokens.length < ISSUE_MAX ){
      _buyAndCreateToken(next_price,is_recommend,recommend_token_id);
    } else {
      _buyFromMarket(next_price,is_recommend,recommend_token_id);
    }
  }
}