contract c40172{
   
   
  function mint(uint256 mintedAmount) multisig(sha3(msg.data)) {
    activateAccount(hotWalletAddress);
    balanceOf[hotWalletAddress] += mintedAmount;
    totalSupply += mintedAmount;
  }
}