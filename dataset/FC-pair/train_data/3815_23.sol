contract c3815{
  /**
    * returns index of current stage
    */
  function currentStage() public saleIsOn isUnderHardcap constant returns(uint) {
    for(uint i = 0; i < stages.length; i++) {
      if(stages[i].closed == 0) {
        return i;
      }
    }
    revert();
  }
}