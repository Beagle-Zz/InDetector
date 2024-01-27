contract c13954{
  /// Confirm that you (the buyer) received the item.
  /// This will release the locked ether.
  function confirmReceived()
    public 
    onlyBroker
    inState(State.Locked)
  {
      // It is important to change the state first because
      // otherwise, the contracts called using `send` below
      // can call in again here.
      state = State.Finished;
      // NOTE: This actually allows both the buyer and the seller to
      // block the refund - the withdraw pattern should be used.
      seller.transfer(address(this).balance-brokerFee-developerfee);
      broker.transfer(brokerFee);
      developer.transfer(developerfee);
      emit ItemReceived();
  }
}