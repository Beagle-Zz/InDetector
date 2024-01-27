contract c3815{
  /**
    * adds stage to sale
    * @param hardcap stage's hardcap in ethers
    * @param price stage's price
    */
  function addStage(uint hardcap, uint price) public onlyOwner {
    require(hardcap > 0 && price > 0);
    Stage memory stage = Stage(hardcap.mul(1 ether), price, 0, 0);
    stages.push(stage);
    totalHardcap = totalHardcap.add(stage.hardcap);
    MilestoneAdded(hardcap, price);
  }
}