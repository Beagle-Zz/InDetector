contract c40149{
   
  function setStandard(bytes32 std) onlyOwnerUnlocked setter {
    standard = std;
  }
}