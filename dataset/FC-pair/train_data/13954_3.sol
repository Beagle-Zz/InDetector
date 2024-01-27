contract c13954{
  /// Confirm the purchase as buyer.
  /// The ether will be locked until confirmReceived
  /// is called.
  function confirmPurchase()
    public 
    condition(msg.value == item.price)
    payable
  {
      if(bBrokerRequired){
        if(state != State.Validated){
          return;
        }
      }
      state = State.Locked;
      buyers.push(msg.sender);
      emit PurchaseConfirmed(msg.sender);
      if(!bBrokerRequired){
		// send money right away
        seller.transfer(item.price-developerfee);
        developer.transfer(developerfee);
      }
  }
}