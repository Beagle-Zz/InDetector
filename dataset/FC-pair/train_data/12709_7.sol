contract c12709{
  //transfers the full funds to the contract owner
  //contractOwner === deployer of the contract
  function withdraw() public onlyContractOwner {
    contractOwner.transfer(address(this).balance);
  }
}