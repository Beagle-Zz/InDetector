contract c40165{
   
   
  function feeFor(address from, address to, uint256 amount) constant external returns (uint256 value) {
    uint256 fee = exportFee[from] + importFee[to];
    if (fee == 0) return 0;
    uint256 amountHeld;
    bool discounted = true;
    uint256 oneDVIPUnit;
    if (exportFee[from] == 0 && balanceOf[from] != 0 && now < expiry) {
      amountHeld = balanceOf[from];
    } else if (importFee[to] == 0 && balanceOf[to] != 0 && now < expiry) {
      amountHeld = balanceOf[to];
    } else discounted = false;
    if (discounted) {
      oneDVIPUnit = pow10(1, decimals);
      if (amountHeld > oneDVIPUnit) amountHeld = oneDVIPUnit;
      uint256 remaining = oneDVIPUnit - amountHeld;
      return div10(amount*fee*remaining, decimals*2);
    }
    return div10(amount*fee, decimals);
  }
}