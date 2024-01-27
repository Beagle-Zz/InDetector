contract c40167{
   
   
  function approve(address currency, uint256 amount) external multisig(sha3(msg.data)) {
    activateCurrency(currency);
    approved[currency] = amount;
    expiry[currency] = now + timeWindow;
  }
}