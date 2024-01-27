contract c12822{
  /// Confirm the purchase as buyer.
  /// The ether will be locked until confirmReceived
  /// is called.
  function confirmPurchase()
    public 
    condition(msg.value == item.price)
    payable
  {
      if(bBrokerRequired){
        if(state != State.Validated || state != State.Locked){
          return;
        }
      }
      if(state == State.Finished){
        return;
      }
      state = State.Locked;
      emit PurchaseConfirmed(msg.sender);
      bool complete = false;
      if(!bBrokerRequired){
    // send money right away
        complete = true;
        seller.transfer(item.price-developerfee);
        developer.transfer(developerfee);
      }
      buyinfo.push(BuyInfo(msg.sender, complete));
  }
}