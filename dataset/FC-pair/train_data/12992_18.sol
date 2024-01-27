contract c12992{
  // new owner only activity.
  // (Voting to be implemented for owner replacement)
  function addController(address newController) public justOwner {
    require(contracts[newController] != true);
    contracts[newController] = true;
    emit ContractControllerAdded(newController);
  }
}