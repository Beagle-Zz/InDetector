contract c7201{
  /// @dev Buy a token.
  function buy(
    ITradeable tradeable,
    uint volume,
    bytes ordersData,
    address destinationAddr,
    address affiliate
  ) external payable
  {
    require(tradingEnabled);
    // Execute the trade (at most fullfilling volume)
    trade(
      false,
      tradeable,
      volume,
      ordersData,
      affiliate
    );
    // Since our balance before trade was 0. What we bought is our current balance.
    uint volumeEffective = tradeable.balanceOf(this);
    // We make sure that something was traded
    require(volumeEffective > 0);
    // Used ethers are: balance_before - balance_after.
    // And since before call balance=0; then balance_before = msg.value
    uint volumeEthEffective = SafeMath.safeSub(msg.value, address(this).balance);
    // IMPORTANT: Check that: effective_price <= agreed_price (guarantee a good deal for the buyer)
    require(
      SafeMath.safeDiv(volumeEthEffective, volumeEffective) <=
      SafeMath.safeDiv(msg.value, volume)
    );
    // Return remaining ethers
    if(address(this).balance > 0) {
      destinationAddr.transfer(address(this).balance);
    }
    // Send the tokens
    transferTradeable(tradeable, destinationAddr, volumeEffective);
    emit Buy(msg.sender, destinationAddr, tradeable, volume, msg.value, volumeEffective, volumeEthEffective);
  }
}