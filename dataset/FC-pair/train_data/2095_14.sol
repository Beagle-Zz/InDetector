contract c2095{
  /**
   * @dev get all GreedyCoins of msg.sender
   */
  function getMyTokens() external view returns ( uint256[] arr_token_id, uint256[] arr_last_deal_time, uint256[] buying_price_arr, uint256[] price_arr ){
    TokenGDC memory token;
    uint256 count = stOwnerTokenCount[msg.sender];
    arr_last_deal_time = new uint256[](count);
    buying_price_arr = new uint256[](count);
    price_arr = new uint256[](count);
    arr_token_id = new uint256[](count);
    uint256 index = 0;
    for ( uint i = 0; i < stTokens.length; i++ ){
      if ( stTokenIndexToOwner[i] == msg.sender ) {
        token = stTokens[i];
        arr_last_deal_time[index] = token.last_deal_time;
        buying_price_arr[index] = token.buying_price;
        price_arr[index] = token.price;
        arr_token_id[index] = i;
        index = index + 1;
      }
    }
  }
}