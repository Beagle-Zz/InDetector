contract c3132{
  // This function is called by the owner to modify the cap.
  function modifyCap (uint cap) public onlyOwner {
    require (contractStage == 1);
    require (contributionCap <= cap && maxContractBalance >= cap);
    contributionCap = cap;
    nextCapTime = 0;
  }
}