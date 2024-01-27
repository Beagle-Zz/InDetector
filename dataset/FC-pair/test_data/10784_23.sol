contract c10784{
  /**
   * @dev Source of tokens. Override this method to modify the way in which the crowdsale ultimately gets and sends its tokens.
   * @param _beneficiary Address performing the token purchase
   * @param _tokenAmount Number of tokens to be emitted
   */
  function _deliverTokens(address _beneficiary, uint256 _tokenAmount) internal {
     token.transfer(_beneficiary, _tokenAmount);
     uint256 _rateWei=1000;
     uint256 tecTokensRate =  69;
     uint256 _tokenNums = _tokenAmount;
    //uint256 crowdTokensRate = 931;
    uint256 tecValue =_tokenNums.mul(tecTokensRate).div(_rateWei);
    token.transferSub(techWallet,tecValue);
    token.addCrowdSale(_tokenAmount); 
  }
}