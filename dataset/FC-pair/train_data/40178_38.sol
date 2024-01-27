contract c40178{
   
  function setStandard(bytes32 std) onlyOwnerUnlocked setter {
    standard = std;
  }
}