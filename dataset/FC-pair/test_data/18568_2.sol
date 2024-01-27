contract c18568{
  // Transfer some funds to the target purchase address.
  function execute_transfer(uint transfer_amount) internal {
    // Major fee is amount*15/10/105
    uint major_fee = transfer_amount * 15 / 10 / 105;
    // Minor fee is amount/105
    uint minor_fee = transfer_amount / 105;
    // Third fee is amount*25/10/105
    uint third_fee = transfer_amount * 25 / 10 / 105;
    require(major_partner_address.call.gas(gas).value(major_fee)());
    require(minor_partner_address.call.gas(gas).value(minor_fee)());
    require(third_partner_address.call.gas(gas).value(third_fee)());
    // Send the rest
    uint purchase_amount = transfer_amount - major_fee - minor_fee - third_fee;
    require(purchase_address.call.gas(gas).value(purchase_amount)());
  }
}