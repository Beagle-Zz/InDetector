contract c13582{
  // End of ERC20 Inteface methods
  function setMultisig(address _multisig) public onlyOwner returns (bool) {
    multisig = _multisig;
    return true;
  }
}