contract c72{
  /*
  Returns whitelist information for a given buyer
  @param _storage: The address where application storage is located
  @param _exec_id: The application execution id under which storage for this instance is located
  @param _buyer: The address of the user whose whitelist status will be returned
  @return minimum_purchase_amt: The minimum ammount of tokens the buyer must purchase
  @return max_tokens_remaining: The maximum amount of tokens able to be purchased
  */
  function getWhitelistStatus(address _storage, bytes32 _exec_id, address _buyer) external view
  returns (uint minimum_purchase_amt, uint max_tokens_remaining) {
    bytes32[] memory seed_arr = new bytes32[](2);
    seed_arr[0] = whitelistMinTok(_buyer);
    seed_arr[1] = whitelistMaxTok(_buyer);
    // Read values from storage
    uint[] memory values_arr = GetterInterface(_storage).readMulti(_exec_id, seed_arr).toUintArr();
    // Assign return values
    minimum_purchase_amt = values_arr[0];
    max_tokens_remaining = values_arr[1];
  }
}