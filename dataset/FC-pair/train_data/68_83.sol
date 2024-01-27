contract c68{
  /*
  Returns basic information on a sale
  @param _storage: The address where application storage is located
  @param _exec_id: The application execution id under which storage for this instance is located
  @return wei_raised: The amount of wei raised in the crowdsale so far
  @return team_wallet: The address to which funds are forwarded during this crowdsale
  @return is_initialized: Whether or not the crowdsale has been completely initialized by the admin
  @return is_finalized: Whether or not the crowdsale has been completely finalized by the admin
  */
  function getCrowdsaleInfo(address _storage, bytes32 _exec_id) external view
  returns (uint wei_raised, address team_wallet, bool is_initialized, bool is_finalized) {
    GetterInterface target = GetterInterface(_storage);
    bytes32[] memory arr_indices = new bytes32[](4);
    arr_indices[0] = totalWeiRaised();
    arr_indices[1] = wallet();
    arr_indices[2] = isConfigured();
    arr_indices[3] = isFinished();
    bytes32[] memory read_values = target.readMulti(_exec_id, arr_indices);
    // Get returned data -
    wei_raised = uint(read_values[0]);
    team_wallet = address(read_values[1]);
    is_initialized = (read_values[2] == 0 ? false : true);
    is_finalized = (read_values[3] == 0 ? false : true);
  }
}