contract c16910{
  // @dev Function that irreversively disables airDrop and should be called right after airDrop is completed.
  function endAirDrop() onlyOwner public returns(bool success){
    require(!airDropFinished);
    airDropFinished = true;
    return true;
  }
}