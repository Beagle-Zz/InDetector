contract c3815{
  /**
    * counts current sale's stages
    */
  function stagesCount() public constant returns(uint) {
    return stages.length;
  }
}