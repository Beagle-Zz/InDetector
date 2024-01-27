contract c12157{
  /**
   * @dev Time and volume based bonus calculations
   * @param _weiAmount Value in wei to be converted into tokens
   * @return Number of tokens that can be purchased with the specified _weiAmount
   */
  function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256) {
    uint256 _tokenAmount = _weiAmount.mul(rate);
    uint256 _bonus = 0;
    //Volume Discount
    if(_tokenAmount >= oneHundredThousand && _tokenAmount < fiveHundredThousand) {
      _bonus = (_tokenAmount.mul(5)).div(100);
    } else if(_tokenAmount >= fiveHundredThousand && _tokenAmount < oneMillion) {
      _bonus = (_tokenAmount.mul(10)).div(100);
    } else if(_tokenAmount >= oneMillion && _tokenAmount < twoMillionFourHundredThousand) {
      _bonus = (_tokenAmount.mul(15)).div(100);
    } else if(_tokenAmount >= twoMillionFourHundredThousand && _tokenAmount < threeMillionTwoHundredThousand) {
      _bonus = (_tokenAmount.mul(20)).div(100);
    } else if(_tokenAmount >= threeMillionTwoHundredThousand){
      _bonus = (_tokenAmount.mul(25)).div(100);
    }
    _tokenAmount = _tokenAmount.add(_bonus);
    // Time Discount
    if(now.sub(openingTime) <= earlyBirdDuration) {
      _bonus = (_tokenAmount.mul(10)).div(100);
      _tokenAmount = _tokenAmount.add(_bonus);
    }  
    return _tokenAmount;
  }
}