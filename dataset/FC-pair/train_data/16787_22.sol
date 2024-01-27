contract c16787{
  /**
   * @dev Calculate the amount of Wei for a given token amount.  The result is rounded down (floored) to a millionth of a US$)
   * @param _tokenAmount Whole number of tokens to be converted to Wei
   * @return amount of Wei for the given amount of tokens
   */
  function tokensToWei(uint256 _tokenAmount) public view returns (uint256) {
    require(tokenNAVMicroUSD != uint256(0));
    require(weiPerUSD != uint256(0));
    return _tokenAmount.mul(tokenNAVMicroUSD).mul(weiPerUSD).div(million);
  }
}