contract c3815{
  /**
    * sets start date
    * @param newStart new softcap
    */
  function setStart(uint newStart) public onlyOwner {
    start = newStart;
  }
}