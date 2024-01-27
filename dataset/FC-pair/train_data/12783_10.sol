contract c12783{
  /**
   * @dev Override to extend the way in which ether is converted to bonus tokens.
   * @param _tokenAmount Value in wei to be converted into tokens
   * @return Number of bonus tokens that can be distributed with the specified bonus percent
   */
  function _getBonusAmount(uint256 _tokenAmount, uint256 _bonusIndex) internal view returns (uint256) {
    uint256 bonusValue = _tokenAmount.mul(bonusLevels[_bonusIndex]);
    return bonusValue.div(100);
  }
}