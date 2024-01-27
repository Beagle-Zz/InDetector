contract c2529{
  //if defcon is set to 3 or lower then function is paused
  modifier defcon3() {
    require(defcon > 3);
    _;
  }
}