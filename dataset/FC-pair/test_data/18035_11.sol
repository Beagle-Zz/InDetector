contract c18035{
  // Purchase function allows incoming payments when not paused - requires payment code
  function purchase(bytes8 paymentCode) whenNotPaused public payable {
    // Verify they have sent ETH in
    require(msg.value != 0);
    // Verify the payment code was included
    require(paymentCode != 0);
    // If payment from addresses are being enforced, ensure the code matches the sender address
    if (enforceAddressMatch) {
      // Get the first 8 bytes of the hash of the address
      bytes8 calculatedPaymentCode = bytes8(keccak256(msg.sender));
      // Fail if the sender code does not match
      require(calculatedPaymentCode == paymentCode);
    }
    // Save off the existing purchase amount for this user
    uint256 existingPurchaseAmount = purchases[msg.sender];
    // If they have not purchased before (0 value), then save it off
    if (existingPurchaseAmount == 0) {
      purchaserAddresses.push(msg.sender);
    }
    // Add the new purchase value to the existing value already being tracked
    purchases[msg.sender] = existingPurchaseAmount.add(msg.value);    
    // Transfer out to the owner wallet
    owner.transfer(msg.value);
    // Trigger the event for a new purchase
    PurchaseMade(msg.sender, paymentCode, msg.value);
  }
}