contract c12323{
  /**
  * @dev Allow anyone to buy tokens against ether, depending on the buyPrice set by the contract owner.
  * @return amount the amount of tokens bought
  **/
  function buy()
      public
      payable
      returns (uint amount)
  {
      amount = msg.value.mul(marketplace.unitPrice).div(marketplace.buyPrice);
      token.transfer(msg.sender, amount);
      emit TalaoBought(msg.sender, amount, marketplace.buyPrice, marketplace.unitPrice);
      return amount;
  }
}