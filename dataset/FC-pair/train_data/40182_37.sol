contract c40182{
   
  function setTotalSupply(uint256 total) onlyOwnerUnlocked setter {
    totalSupply = total;
  }
}