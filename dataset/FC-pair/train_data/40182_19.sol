contract c40182{
   
  function destroyTokens(uint256 destroyAmount) multisig(sha3(msg.data)) {
    assert(treasuryBalance >= destroyAmount);
    treasuryBalance -= destroyAmount;
    totalSupply -= destroyAmount;
  }
}