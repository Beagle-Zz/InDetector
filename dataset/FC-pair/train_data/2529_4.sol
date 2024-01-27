contract c2529{
  //if defcon is set to 2 or lower then function is paused
   modifier defcon2() {
    require(defcon > 2);
    _;
  }
}