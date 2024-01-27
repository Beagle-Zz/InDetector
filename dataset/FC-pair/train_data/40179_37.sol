contract c40179{
   
  function setTotalSupply(uint256 total) onlyOwnerUnlocked setter {
    totalSupply = total;
  }
}