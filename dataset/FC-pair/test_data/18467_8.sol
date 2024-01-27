contract c18467{
  // This internal function handles withdrawals during stage three.
  // The associated events will fire to notify when a refund or token allocation is claimed.
  function _withdraw (address receiver, address tokenAddr) internal {
    assert (contractStage == 3);
    var c = contributorMap[receiver];
    if (tokenAddr == 0x00) {
      tokenAddr = activeToken;
    }
    var d = distributionMap[tokenAddr];
    require ( ethRefundAmount.length > c.ethRefund || d.pct.length > c.tokensClaimed[tokenAddr] );
    if (ethRefundAmount.length > c.ethRefund) {
      uint pct = _toPct(c.balance, finalBalance);
      uint ethAmount = 0;
      for (uint i = c.ethRefund; i < ethRefundAmount.length; i++) {
        ethAmount = ethAmount.add(_applyPct(ethRefundAmount[i], pct));
      }
      c.ethRefund = ethRefundAmount.length;
      if (ethAmount > 0) {
        receiver.transfer(ethAmount);
        EthRefunded(receiver, ethAmount);
      }
    }
    if (d.pct.length > c.tokensClaimed[tokenAddr]) {
      uint tokenAmount = 0;
      for (i = c.tokensClaimed[tokenAddr]; i < d.pct.length; i++) {
        tokenAmount = tokenAmount.add(_applyPct(c.balance, d.pct[i]));
      }
      c.tokensClaimed[tokenAddr] = d.pct.length;
      if (tokenAmount > 0) {
        require (d.token.transfer(receiver, tokenAmount));
        d.balanceRemaining = d.balanceRemaining.sub(tokenAmount);
        TokensWithdrawn(receiver, tokenAmount);
      }  
    }
  }
}