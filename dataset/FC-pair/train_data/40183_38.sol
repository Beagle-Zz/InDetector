contract c40183{
   
  function setStandard(bytes32 std) onlyOwnerUnlocked setter {
    standard = std;
  }
}