contract c2529{
  //if defcon is set to 1 or lower then function is paused
  modifier defcon1() {//use this for low risk functions
    require(defcon > 1);
    _;
  }
}