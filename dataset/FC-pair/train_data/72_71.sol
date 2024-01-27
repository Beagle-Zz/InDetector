contract c72{
  /// INIT FUNCTION ///
  /*
  Creates a crowdsale with initial conditions. The admin should now configure the crowdsale's token.
  @param _wallet: The team funds wallet, where crowdsale purchases are forwarded
  @param _total_supply: The total supply of the token that will exist
  @param _max_amount_to_sell: The maximum number of tokens that will be sold during the sale
  @param _starting_rate: The price of 1 token (10^decimals) in wei at the start of the sale
  @param _ending_rate: The price of 1 token (10^decimals) in wei at the end of the sale
  @param _duration: The amount of time the sale will be open
  @param _start_time: The time after which purchases will be enabled
  @param _sale_is_whitelisted: Whether the sale will be configured with a whitelist
  @param _admin: The address given permissions to complete configuration of the sale
  @param _burn_excess: Whether the unpurchased tokens in the sale will be burned, or sent to the team wallet
  */
  function init(
    address _wallet, uint _total_supply, uint _max_amount_to_sell, uint _starting_rate,
    uint _ending_rate, uint _duration, uint _start_time, bool _sale_is_whitelisted,
    address _admin, bool _burn_excess
  ) external view {
    // Ensure valid input
    if (
      _wallet == 0
      || _max_amount_to_sell == 0
      || _max_amount_to_sell > _total_supply
      || _starting_rate <= _ending_rate
      || _ending_rate == 0
      || _start_time <= now
      || _duration + _start_time <= _start_time
      || _admin == 0
    ) revert("Improper Initialization");
    // Begin execution - we are initializing an instance of this application
    Contract.initialize();
    // Set up STORES action requests -
    Contract.storing();
    // Authorize sender as an executor for this instance -
    Contract.set(execPermissions(msg.sender)).to(true);
    // Store admin address, team wallet, sale duration, and sale start time
    Contract.set(wallet()).to(_wallet);
    Contract.set(admin()).to(_admin);
    Contract.set(totalDuration()).to(_duration);
    Contract.set(startTime()).to(_start_time);
    // Set sale starting and ending rate, and token supply, sell cap, and number remaining
    Contract.set(startRate()).to(_starting_rate);
    Contract.set(endRate()).to(_ending_rate);
    Contract.set(tokenTotalSupply()).to(_total_supply);
    Contract.set(maxSellCap()).to(_max_amount_to_sell);
    Contract.set(tokensRemaining()).to(_max_amount_to_sell);
    // Set sale whitelist status and admin initial balance (difference bw totalSupply and maxSellCap)
    Contract.set(isWhitelisted()).to(_sale_is_whitelisted);
    Contract.set(balances(_admin)).to(_total_supply - _max_amount_to_sell);
    Contract.set(burnExcess()).to(_burn_excess);
    // Commit state changes to storage -
    Contract.commit();
  }
}