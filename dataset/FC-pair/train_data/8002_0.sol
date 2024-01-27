contract c8002{
  // this forces abi to give us the whole array
  function getUpdateTimes() external view
    returns(uint[global_length])
  {
    return lastUpdateByChunk;
  }  
}