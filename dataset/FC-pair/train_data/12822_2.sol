contract c12822{
  /// Abort the purchase and reclaim the ether.
  /// Can only be called by the seller before
  /// the contract is locked.
  function abort()
    public 
    onlySeller
  {
    returnMoneyToBuyers();
    emit AbortedBySeller();
    // validated = false;
    seller.transfer(address(this).balance);
  }
}