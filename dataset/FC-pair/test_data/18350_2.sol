contract c18350{
  /**
  * @dev function that sells available tokens
  */
  function buyTokens() payable whenSaleIsActive {
    // Calculate tokens to sell
    uint256 weiAmount = msg.value;
    uint256 tokens = weiAmount.mul(RATE);
    BoughtTokens(msg.sender, tokens);
    // Increment raised amount
    raisedAmount = raisedAmount.add(msg.value);
    // Send tokens to buyer
    token.transfer(msg.sender, tokens);
    // Send money to owner
    owner.transfer(msg.value);
  }
}