contract c16965{
  // Manually spread iron profits to token holders
  function _HOLDersPayRoll() onlyOwner public {
    uint256 _amountToPay = address(this).balance;
    uint256 individualPayRoll = _amountToPay.div(uint256(HOLDersList.length));
    for (uint256 r = 0; r < HOLDersList.length; r++){
      // Send individual token holder payroll
      address HODLer = HOLDersList[r].HOLDersAddress;
      HODLer.transfer(individualPayRoll);
      // Add counter, to check how many times an address has been paid (the higher the most time this address has HODL)
      PayRollCount[HOLDersList[r].HOLDersAddress] = PayRollCount[HOLDersList[r].HOLDersAddress].add(1);
    }
  }
}