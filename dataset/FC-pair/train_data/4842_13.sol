contract c4842{
  // Get the number of addresses that have contributed to the sale
  function getPurchaserAddressCount() public constant returns (uint) {
    return purchaserAddresses.length;
  }
}