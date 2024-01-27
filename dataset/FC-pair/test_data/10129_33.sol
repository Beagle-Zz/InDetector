contract c10129{
  /**
   * Called from invest() to confirm if the curret investment does not break our cap rule.
   */
  function isBreakingCap(uint weiAmount, uint tokenAmount, uint weiRaisedTotal, uint tokensSoldTotal) constant returns (bool limitBroken) {
    if(weiRaisedTotal > saleWeiCap) {
      return true;
    } else {
      return false;
    }
  }
}