contract c2107{
    /*
     * @param _weiAmount Value in wei to be converted into tokens
     * @return Number of tokens that can be purchased with the specified _weiAmount
     */
    function getTokenAmount(uint _weiAmount) internal view returns (uint) {
      uint preDecimalAmount = _weiAmount.div(rate);
      uint postDecimalAmount = preDecimalAmount.mul(1 ether);
      return postDecimalAmount;
    }
}