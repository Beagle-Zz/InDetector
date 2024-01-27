contract c40165{
   
  function setStandard(bytes32 std) onlyOwnerUnlocked setter {
    standard = std;
  }
}