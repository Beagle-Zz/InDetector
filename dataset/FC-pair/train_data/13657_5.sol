contract c13657{
  // Modifier that requires msg.sender to be Crowdsale Contract
  modifier onlyIcoContract() {
    require(msg.sender == icoContractAddress);
    _;
  }
}