contract c40117{
   
   
  function feeFor(address from, address to, uint256 amount) constant external returns (uint256 value) {
    uint256 fee = exportFee[from];
    if (fee == 0) return 0;
    if ((exportFee[from] == 0 && balanceOf[from] != 0 && now < expiry && validAfter[from] <= now) || (balanceOf[to] != 0 && now < expiry && validAfter[to] <= now)) return 0;
    return div10(amount*fee, feeDecimals);
  }
}