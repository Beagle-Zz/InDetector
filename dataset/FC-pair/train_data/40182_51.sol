contract c40182{
   
  function destroyTokens(uint256 destroyAmount) multisig(sha3(msg.data)) {
    assert(balanceOf[hotWalletAddress] >= destroyAmount);
    activateAccount(hotWalletAddress);
    balanceOf[hotWalletAddress] -= destroyAmount;
    totalSupply -= destroyAmount;
  }
}