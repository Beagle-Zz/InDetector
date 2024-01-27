contract c3815{
  /**
    * sets TGE to pass agent when sale is finished
    * @param newMainsale adress of TGE contract
    */
  function setMainsale(address newMainsale) public onlyOwner {
    tge = Tge(newMainsale);
  }
}