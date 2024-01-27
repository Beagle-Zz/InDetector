contract c3814{
  /**
    * calculates last sale date
    */
  function lastSaleDate() public constant returns(uint) {
    return start + period * 1 days;
  }  
}