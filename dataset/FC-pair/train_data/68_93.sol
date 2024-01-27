contract c68{
  /*
  Returns whitelist information for a given buyer
  @param _storage: The address where application storage is located
  @param _exec_id: The application execution id under which storage for this instance is located
  @param _tier_index: The index of the tier about which the whitelist information will be pulled
  @param _buyer: The address of the user whose whitelist status will be returned
  @return minimum_purchase_amt: The minimum ammount of tokens the buyer must purchase
  @return max_tokens_remaining: The maximum amount of tokens able to be purchased by the user in this tier
  */
  function getWhitelistStatus(address _storage, bytes32 _exec_id, uint _tier_index, address _buyer) external view
  returns (uint minimum_purchase_amt, uint max_tokens_remaining) {
    GetterInterface target = GetterInterface(_storage);
    bytes32[] memory arr_indices = new bytes32[](2);
    // Push whitelist minimum contribution location to buffer
    arr_indices[0] = whitelistMinTok(_tier_index, _buyer);
    // Push whitlist maximum spend amount remaining location to buffer
    arr_indices[1] = whitelistMaxTok(_tier_index, _buyer);
    // Read from storage and return
    uint[] memory read_values = target.readMulti(_exec_id, arr_indices).toUintArr();
    // Ensure correct return length
    assert(read_values.length == 2);
    minimum_purchase_amt = read_values[0];
    max_tokens_remaining = read_values[1];
  }
}