contract c18467{
  // This function can be called during stages one or two to modify the maximum balance of the contract.
  // It can only be called by the owner. The amount cannot be set to lower than the current balance of the contract.
  function modifyMaxContractBalance (uint amount) public onlyOwner {
    require (contractStage < 3);
    require (amount >= contributionMin);
    require (amount >= this.balance);
    maxContractBalance = amount;
  }
}