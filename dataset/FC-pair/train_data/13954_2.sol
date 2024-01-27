contract c13954{
  /// Abort the purchase and reclaim the ether.
  /// Can only be called by the seller before
  /// the contract is locked.
  function abort()
    public 
    onlySeller
    inState(State.Created)
  {
      emit AbortedBySeller();
      state = State.Finished;
      // validated = false;
      seller.transfer(address(this).balance);
  }
}