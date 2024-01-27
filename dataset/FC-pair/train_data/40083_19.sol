contract c40083{
   
   
  function feeFor(address from, address to, uint256 amount) constant external returns (uint256 value) {
    uint256 fee = exportFee[from];
    if (fee == 0) return 0;
    if (now >= expiry) return amount*fee / baseFeeDivisor;
    uint256 amountHeld;
    if (balanceOf[to] != 0) {
      if (validAfter[to].ts + mustHoldFor < now) amountHeld = balanceOf[to];
      else amountHeld = validAfter[to].last;
      if (amountHeld >= singleDVIPQty) return 0;
      return amount*fee*(singleDVIPQty - amountHeld) / feeDivisor;
    } else return amount*fee / baseFeeDivisor;
  }
}