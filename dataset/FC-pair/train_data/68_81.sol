contract c68{
  /*
  Creates a crowdsale with initial conditions. The admin should now initialize the crowdsale's token, as well
  as any additional tiers of the crowdsale that will exist, followed by finalizing the initialization of the crowdsale.
  @param _team_wallet: The team funds wallet, where crowdsale purchases are forwarded
  @param _start_time: The start time of the initial tier of the crowdsale
  @param _initial_tier_name: The name of the initial tier of the crowdsale
  @param _initial_tier_price: The price of each token purchased in wei, for the initial crowdsale tier
  @param _initial_tier_duration: The duration of the initial tier of the crowdsale
  @param _initial_tier_token_sell_cap: The maximum number of tokens that can be sold during the initial tier
  @param _initial_tier_min_purchase: The minimum number of tokens that must be purchased by a user in the initial tier
  @param _initial_tier_is_whitelisted: Whether the initial tier of the crowdsale requires an address be whitelisted for successful purchase
  @param _initial_tier_duration_is_modifiable: Whether the initial tier of the crowdsale has a modifiable duration
  @param _admin: A privileged address which is able to complete the crowdsale initialization process
  */
  function init(
    address _team_wallet,
    uint _start_time,
    bytes32 _initial_tier_name,
    uint _initial_tier_price,
    uint _initial_tier_duration,
    uint _initial_tier_token_sell_cap,
    uint _initial_tier_min_purchase,
    bool _initial_tier_is_whitelisted,
    bool _initial_tier_duration_is_modifiable,
    address _admin
  ) external view {
    // Begin execution - we are initializing an instance of this application
    Contract.initialize();
    // Ensure valid input
    if (
      _team_wallet == 0
      || _initial_tier_price == 0
      || _start_time < now
      || _start_time + _initial_tier_duration <= _start_time
      || _initial_tier_token_sell_cap == 0
      || _admin == address(0)
    ) revert('improper initialization');
    // Set up STORES action requests -
    Contract.storing();
    // Authorize sender as an executor for this instance -
    Contract.set(execPermissions(msg.sender)).to(true);
    // Store admin address, team wallet, initial tier duration, and sale start time
    Contract.set(admin()).to(_admin);
    Contract.set(wallet()).to(_team_wallet);
    Contract.set(totalDuration()).to(_initial_tier_duration);
    Contract.set(startTime()).to(_start_time);
    // Store initial crowdsale tier list length and initial tier information
    Contract.set(saleTierList()).to(uint(1));
    // Tier name
    Contract.set(tierName(uint(0))).to(_initial_tier_name);
    // Tier token sell cap
    Contract.set(tierCap(uint(0))).to(_initial_tier_token_sell_cap);
    // Tier purchase price
    Contract.set(tierPrice(uint(0))).to(_initial_tier_price);
    // Tier active duration
    Contract.set(tierDuration(uint(0))).to(_initial_tier_duration);
    // Tier minimum purchase size
    Contract.set(tierMin(uint(0))).to(_initial_tier_min_purchase);
    // Whether this tier's duration is modifiable prior to its start time
    Contract.set(tierModifiable(uint(0))).to(_initial_tier_duration_is_modifiable);
    // Whether this tier requires an address be whitelisted to complete token purchase
    Contract.set(tierWhitelisted(uint(0))).to(_initial_tier_is_whitelisted);
    // Store current crowdsale tier (offset by 1)
    Contract.set(currentTier()).to(uint(1));
    // Store current tier end time
    Contract.set(currentEndsAt()).to(_initial_tier_duration.add(_start_time));
    // Store current tier tokens remaining
    Contract.set(currentTokensRemaining()).to(_initial_tier_token_sell_cap);
    Contract.commit();
  }
}