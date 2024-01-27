contract c72{
  /*
  Returns sale information on a crowdsale
  @param _storage: The address where storage is located
  @param _exec_id: The application execution id under which storage for this instance is located
  @return wei_raised: The amount of wei raised in the crowdsale so far
  @return team_wallet: The address to which funds are forwarded during this crowdsale
  @return minimum_contribution: The minimum amount of tokens that must be purchased
  @return is_initialized: Whether or not the crowdsale has been completely initialized by the admin
  @return is_finalized: Whether or not the crowdsale has been completely finalized by the admin
  */
  function getCrowdsaleInfo(address _storage, bytes32 _exec_id) external view
  returns (uint wei_raised, address team_wallet, uint minimum_contribution, bool is_initialized, bool is_finalized, bool burn_excess) {
    // Set up bytes32 array to store storage seeds
    bytes32[] memory seed_arr = new bytes32[](6);
    //Assign each location of seed_arr to its respective seed
    seed_arr[0] = totalWeiRaised();
    seed_arr[1] = wallet();
    seed_arr[2] = globalMinPurchaseAmt();
    seed_arr[3] = isConfigured();
    seed_arr[4] = isFinished();
    seed_arr[5] = burnExcess();
    //Read and return all wei_raised, wallet address, min_contribution, and init/finalization status
    bytes32[] memory values_arr = GetterInterface(_storage).readMulti(_exec_id, seed_arr);
    // Assign all return values
    wei_raised = uint(values_arr[0]);
    team_wallet = address(values_arr[1]);
    minimum_contribution = uint(values_arr[2]);
    is_initialized = (values_arr[3] != 0 ? true : false);
    is_finalized = (values_arr[4] != 0 ? true : false);
    burn_excess = values_arr[5] != 0 ? true : false;
  }
}