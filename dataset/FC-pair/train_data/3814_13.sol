contract c3814{
  /**
    * counts current sale's stages
    */
  function stagesCount() public constant returns(uint) {
    return stages.length;
  }
}