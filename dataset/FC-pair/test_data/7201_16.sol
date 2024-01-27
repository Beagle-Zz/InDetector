contract c7201{
  /// @dev Trade buy or sell orders.
  function trade(
    bool isSell,
    ITradeable tradeable,
    uint volume,
    bytes ordersData,
    address affiliate
  ) internal
  {
    uint remainingVolume = volume;
    uint offset = ordersData.length;
    while(offset > 0 && remainingVolume > 0) {
      //Get the trader
      uint8 protocolId = bytesToUint8(offset, ordersData);
      ITrader trader = traders.getTrader(protocolId);
      require(trader != address(0));
      //Get the order data
      uint dataLength = trader.getDataLength();
      offset = SafeMath.safeSub(offset, dataLength);
      bytes memory orderData = slice(ordersData, offset, dataLength);
      //Fill order
      remainingVolume = fillOrder(
         isSell,
         tradeable,
         trader,
         remainingVolume,
         orderData,
         affiliate
      );
    }
  }
}