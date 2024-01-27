contract c2095{
  /**
   * @dev query detail of one GreedyCoin
   */
  function queryToken(uint256 _tokenId) external view returns ( uint256 price, uint256 last_deal_time ) {
    TokenGDC memory token = stTokens[_tokenId];
    price = token.price;
    last_deal_time = token.last_deal_time;
  }
}