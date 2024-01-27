contract c12323{
  /**
  * @dev Allow anyone to sell tokens for ether, depending on the sellPrice set by the contract owner.
  * @param amount the number of tokens to be sold
  * @return revenue ethers sent in return
  **/
  function sell(uint amount)
      public
      returns (uint revenue)
  {
      require(token.balanceOf(msg.sender) >= amount, "sender has not enough tokens");
      token.transferFrom(msg.sender, this, amount);
      revenue = amount.mul(marketplace.sellPrice).div(marketplace.unitPrice);
      msg.sender.transfer(revenue);
      emit TalaoSold(msg.sender, amount, marketplace.sellPrice, marketplace.unitPrice);
      return revenue;
  }
}