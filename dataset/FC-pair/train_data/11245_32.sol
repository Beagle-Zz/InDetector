contract c11245{
  /**
   * @notice helper function to generate tokens with ratio
   */
  function generateTargetTokens(address _beneficiary, uint256 _targetTotalSupply, uint256 _ratio) internal {
    uint256 tokens = _targetTotalSupply.mul(_ratio).div(coeff);
    generateTokens(_beneficiary, tokens);
  }
}