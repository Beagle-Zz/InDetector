contract c67{
  // Calculates the amount of wei spent and number of tokens purchased from sale details
  function getPurchaseInfo(
    uint _token_decimals,
    uint _purchase_price,
    uint _tokens_remaining,
    uint _max_purchase_amount,
    uint _minimum_purchase_amount,
    bool _tier_is_whitelisted
  ) private view returns (uint amount_spent, uint amount_purchased) {
    // Get amount of wei able to be spent, given the number of tokens remaining -
    if (msg.value.mul(10 ** _token_decimals).div(_purchase_price) > _tokens_remaining)
      amount_spent = _purchase_price.mul(_tokens_remaining).div(10 ** _token_decimals);
    else
      amount_spent = msg.value;
    // Get number of tokens able to be purchased with the amount spent -
    amount_purchased = amount_spent.mul(10 ** _token_decimals).div(_purchase_price);
    // If the current tier is whitelisted -
    if (_tier_is_whitelisted && amount_purchased > _max_purchase_amount) {
      amount_purchased = _max_purchase_amount;
      amount_spent = amount_purchased.mul(_purchase_price).div(10 ** _token_decimals);
    }
    // Ensure spend amount is valid -
    if (amount_spent == 0 || amount_spent > msg.value)
      revert('invalid spend amount');
    // Ensure amount of tokens to purchase is not greater than the amount of tokens remaining in this tier -
    if (amount_purchased > _tokens_remaining || amount_purchased == 0)
      revert('invalid purchase amount');
    // Ensure amount of tokens to purchase is greater than the spender's minimum contribution cap -
    if (amount_purchased < _minimum_purchase_amount)
      revert('under min cap');
  }
}