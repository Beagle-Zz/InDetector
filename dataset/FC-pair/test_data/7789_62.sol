contract c7789{
  /**
    * @dev Set crowdsale address which can distribute tokens even when onlyWhenTransferAllowed is
    * false.
    * @param crowdsaleAddr Address of token offering contract.
    */
  function setCrowdsaleAddress(
    address crowdsaleAddr
  )
    external
    onlyOwner()
  {
    crowdsaleAddress = crowdsaleAddr;
  }
}