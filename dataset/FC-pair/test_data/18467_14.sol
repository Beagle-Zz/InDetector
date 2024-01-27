contract c18467{
  // This function reopens the contract to contributions, returning it to stage one.
  // It can only be called by the owner during stage two.
  function reopenContributions () public onlyOwner {
    require (contractStage == 2);
    contractStage = 1;
  }
}