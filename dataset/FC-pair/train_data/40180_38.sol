contract c40180{
   
  function setStandard(bytes32 std) onlyOwnerUnlocked setter {
    standard = std;
  }
}