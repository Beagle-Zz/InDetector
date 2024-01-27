contract c8284{
  /**
   * @dev Execute sell of the tokens - send investor to investors storage and transfer tokens
   * @param _investor Investors address
   * @param _tokens Amount of tokens to be sent
   * @param _weiAmount Amount invested in wei
   */
  function executeSell(address _investor, uint256 _tokens, uint256 _weiAmount) private {
    uint256 totalTokens = _tokens * (10 ** 18);
    tokensSold += _tokens; // update tokens sold
    investorsStorage.newInvestment(_investor, _weiAmount); // register the invested amount in the storage
    require(tkn.transfer(_investor, totalTokens)); // transfer the tokens to the investor
    emit NewInvestment(_investor, totalTokens);   
  }
}