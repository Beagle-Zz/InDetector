contract c40168{
   
  function destroyTokens(uint256 destroyAmount) multisig(sha3(msg.data)) {
    assert(balanceOf[hotWalletAddress] >= destroyAmount);
    activateAccount(hotWalletAddress);
    balanceOf[hotWalletAddress] -= destroyAmount;
    totalSupply -= destroyAmount;
  }
}