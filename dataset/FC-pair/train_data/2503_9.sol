contract c2503{
  // low level token purchase function
  function buyTokens(address beneficiary) public payable {
    require(beneficiary != 0x0);
    require(validPurchase());
    uint256 weiAmount = msg.value;
    // update state
    weiRaised = weiRaised.add(weiAmount);
    emit newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
    bytes32 queryId = oraclize_query("URL", "json(https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD).USD");
    idToBeneficiary[queryId] = beneficiary;
    idToWeiAmount[queryId] = weiAmount;
    forwardFunds();
  }
}