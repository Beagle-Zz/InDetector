contract c11119{
  /**
   * @dev Determines how ETH is stored/forwarded on purchases.
   */
  function _forwardFunds() internal {
    uint256 _rateWei=1000;
    uint256 tecTokensRate =  69;
    //uint256 crowdTokensRate = 931;
    uint256 msgValue = msg.value;
    uint256 tecValue =msgValue.mul(tecTokensRate).div(_rateWei);
    uint256 crowdValue =msgValue.sub(tecValue);
    techWallet.transfer(tecValue);
    wallet.transfer(crowdValue);
    emit TokenAmount("_forwardFunds ", msgValue);
    emit TokenAmount("_forwardFunds ", tecValue);
    emit TokenAmount("_forwardFunds ", crowdValue);
  }
}