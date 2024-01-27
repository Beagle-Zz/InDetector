contract c3815{
  /**
    * updates stage
    * @param number index of item to update
    * @param hardcap stage's hardcap in ethers
    * @param price stage's price
    */
  function changeStage(uint8 number, uint hardcap, uint price) public onlyOwner {
    require(number >= 0 && number < stages.length);
    Stage storage stage = stages[number];
    totalHardcap = totalHardcap.sub(stage.hardcap);    
    stage.hardcap = hardcap.mul(1 ether);
    stage.price = price;
    totalHardcap = totalHardcap.add(stage.hardcap);    
  }
}