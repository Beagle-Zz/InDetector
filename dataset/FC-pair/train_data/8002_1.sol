contract c8002{
  // helper index conversion function
  function getIndex(uint8 x, uint8 y) public pure returns(uint) {
    return y*global_width+x;
  }
}