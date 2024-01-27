contract c16799{
  //Functions for the owner
  // Buy the tokens. Sends ETH to the presale wallet and records the ETH amount held in the contract.
  function buy_the_tokens() onlyOwner minAmountReached underMaxAmount {
    //Avoids burning the funds
    require(!bought_tokens && sale != 0x0);
    //Record that the contract has bought the tokens.
    bought_tokens = true;
    //Sends the fee before so the contract_eth_value contains the correct balance
    uint256 dev_fee = SafeMath.div(fees, FEE_DEV);
    uint256 audit_fee = SafeMath.div(fees, FEE_AUDIT);
    owner.transfer(SafeMath.sub(SafeMath.sub(fees, dev_fee), audit_fee));
    developer.transfer(dev_fee);
    auditor.transfer(audit_fee);
    //Record the amount of ETH sent as the contract's current value.
    contract_eth_value = this.balance;
    contract_eth_value_bonus = this.balance;
    // Transfer all the funds to the crowdsale address.
    sale.transfer(contract_eth_value);
  }
}