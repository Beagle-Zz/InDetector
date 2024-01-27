contract c11245{
  /**
   * @dev Distribute ERC20 token to `holder`s according to ratio.
   */
  function distributeToken(ERC20Basic _token, uint256 _targetTotalSupply) internal {
    require(!distributed, "Already distributed");
    distributed = true;
    for (uint8 i = 0; i < holders.length; i++) {
      uint256 holderAmount = _targetTotalSupply.mul(uint256(holders[i].ratio)).div(coeff);
      deliverTokens(_token, holders[i].addr, holderAmount);
    }
    emit Distributed(); // A single log to reduce gas
  }
}