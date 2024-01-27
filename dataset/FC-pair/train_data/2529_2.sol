contract c2529{
  //if defcon is set to 4 or lower then function is paused
  modifier defcon4() {//use this for high risk functions
    require(defcon > 4);
    _;
  }
}