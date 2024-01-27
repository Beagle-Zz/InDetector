contract c7201{
  /// @dev sell a token.
  function sell(
    ITradeable tradeable,
    uint volume,
    uint volumeEth,
    bytes ordersData,
    address destinationAddr,
    address affiliate
  ) external
  {
    require(tradingEnabled);
    // We transfer to ouselves the user's trading volume, to operate on it
    // note: Our balance is 0 before this
    require(tradeable.transferFrom(msg.sender, this, volume));
    // Execute the trade (at most fullfilling volume)
    trade(
      true,
      tradeable,
      volume,
      ordersData,
      affiliate
    );
    // Check how much we traded. Our balance = volume - tradedVolume
    // then: tradedVolume = volume - balance
    uint volumeEffective = SafeMath.safeSub(volume, tradeable.balanceOf(this));
    // We make sure that something was traded
    require(volumeEffective > 0);
    // Collects service fee
    uint volumeEthEffective = collectSellFee(affiliate);
    // IMPORTANT: Check that: effective_price >= agreed_price (guarantee a good deal for the seller)
    require(
      SafeMath.safeDiv(volumeEthEffective, volumeEffective) >=
      SafeMath.safeDiv(volumeEth, volume)
    );
    // Return remaining volume
    if (volumeEffective < volume) {
     transferTradeable(tradeable, destinationAddr, SafeMath.safeSub(volume, volumeEffective));
    }
    // Send ethers obtained
    destinationAddr.transfer(volumeEthEffective);
    emit Sell(msg.sender, destinationAddr, tradeable, volume, volumeEth, volumeEffective, volumeEthEffective);
  }
}