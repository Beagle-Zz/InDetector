contract c14643{
  // This function allows the contract owner to force a withdrawal to any contributor.
  function withdrawFor (address contributor, address tokenAddr) public onlyOwner {
    require (contractStage == 2);
    require (whitelist[contributor].balance > 0);
    _withdraw(contributor,tokenAddr);
  }
}