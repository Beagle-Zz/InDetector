contract c16401{
  // Forces the transfer of the deed to a new owner, 
  // if a higher price was paid. This functionality can be paused by the owner.
  function appropriate(uint256 _deedId)
  external whenNotPaused nonReentrant payable {
    // Get current price of deed
    uint256 price = priceOf(_deedId);
     // The current owner is forbidden to appropriate himself.
    address oldOwner = this.ownerOf(_deedId);
    address newOwner = msg.sender;
    require(oldOwner != newOwner);
    // price must be more than zero
    require(priceOf(_deedId) > 0); 
    // offered price must be more than or equal to the current price
    require(msg.value >= price); 
    /// Any over-payment by the buyer will be sent back to him/her
    uint256 excess = msg.value.sub(price);
    // Clear any outstanding approvals and transfer the deed.*/
    clearApprovalAndTransfer(oldOwner, newOwner, _deedId);
    uint256 nextPrice = nextPriceOf(_deedId);
    deeds[_deedId].price = nextPrice;
    // transfer fee is calculated
    uint256 transferFee = calculateTransferFee(price);
    /// previous owner gets entire new payment minus the transfer fee
    uint256 oldOwnerPayment = price.sub(transferFee);
    /// using Pullpayment for safety
    asyncSend(factTeamOf(_deedId), transferFee);
    asyncSend(oldOwner, oldOwnerPayment);
    if (excess > 0) {
       asyncSend(newOwner, excess);
    }
    emit Appropriation(_deedId, oldOwner, newOwner, price, nextPrice,
    transferFee, excess, oldOwnerPayment);
  }
}