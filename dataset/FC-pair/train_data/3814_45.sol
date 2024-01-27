contract c3814{
  /**
    * sets max number of tokens to ever mint
    * @param newTotalTokenSupply max number of tokens (incl. 18 dec points)
    */
  function setTotalTokenSupply(uint newTotalTokenSupply) public onlyOwner {
    totalTokenSupply = newTotalTokenSupply;
  }
}