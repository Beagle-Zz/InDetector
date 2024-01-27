contract c40171{
   
  function setTotalSupply(uint256 total) onlyOwnerUnlocked setter {
    totalSupply = total;
  }
}