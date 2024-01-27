contract c11454{
    /**
     * @dev Calculate tokens amount and refund amount at purchase procedure.
     */
    function calcMultiStage() internal returns(uint256[2]) {
      uint256 stageBoughtTokens;
      uint256 undistributedAmount = msg.value;
      uint256 _boughtTokens = 0;
      uint256 undistributedTokens = availableTokens();
      while(undistributedAmount > 0 && undistributedTokens > 0) {
        bool needNextStage = false;
        stageBoughtTokens = getTokensAmount(undistributedAmount);
        if (stageBoughtTokens > availableOnStage()) {
          stageBoughtTokens = availableOnStage();
          needNextStage = true;
        }
        _boughtTokens = _boughtTokens.add(stageBoughtTokens);
        undistributedTokens = undistributedTokens.sub(stageBoughtTokens);
        undistributedAmount = undistributedAmount.sub(getTokensCost(stageBoughtTokens));
        soldOnStage = soldOnStage.add(stageBoughtTokens);
        if (needNextStage)
          toNextStage();
      }
      return [_boughtTokens,undistributedAmount];
    }
}