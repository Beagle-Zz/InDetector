contract c18600{
  /*
    It may be needed to assign tokens in batches if multiple clients invested
    in any other crypto currency.
    NOTE: this will fail if there are not enough tokens left for at least one investor.
        for this to work all investors must get all their tokens.
  */
  function assignTokensToMultipleInvestors(address[] _beneficiaries, uint256[] _tokensAmount) onlyAssginer public {
    require(_beneficiaries.length == _tokensAmount.length);
    for (uint i = 0; i < _tokensAmount.length; i++) {
      _processTokensAssgin(_beneficiaries[i], _tokensAmount[i]);
    }
  }
}