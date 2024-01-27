contract c12537{
  /// Confirm that you (the buyer) received the item.
  /// This will release the locked ether.
  function confirmReceived()
    public 
    onlyBroker
    inState(State.Locked)
  {
      if(buyinfo.length>0){
          for (uint256 x = 0; x < buyinfo.length; x++) {
              confirmReceivedAt(x);
          }
      }
      // It is important to change the state first because
      // otherwise, the contracts called using `send` below
      // can call in again here.
      state = State.Finished;
  }
}