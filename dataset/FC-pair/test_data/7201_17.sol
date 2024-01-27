contract c7201{
  /// @dev Fills a buy order.
  function fillOrder(
    bool isSell,
    ITradeable tradeable,
    ITrader trader,
    uint remaining,
    bytes memory orderData,
    address affiliate
    ) internal returns(uint)
  {
    //Checks that there is enoughh amount to execute the trade
    uint volume;
    uint volumeEth;
    (volume, volumeEth) = trader.getFillVolumes(
      isSell,
      orderData,
      remaining,
      address(this).balance
    );
    if(volume > 0) {
      if(isSell) {
        //Approve available amount of token to trader
        require(tradeable.approve(trader, volume));
      } else {
        //Collects service fee
        //TODO: transfer fees after all iteration
        volumeEth = collectBuyFee(volumeEth, affiliate);
        address(trader).transfer(volumeEth);
      }
      //Call trader to trade orders
      trader.trade(
        isSell,
        orderData,
        volume,
        volumeEth
      );
    }
    return SafeMath.safeSub(remaining, volume);
  }
}