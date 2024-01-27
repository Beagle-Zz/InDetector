contract c40338{
   
  function withdraw(uint proposalId) {
     
    uint balance = whiteList[proposalId].dao.balanceOf(msg.sender);
    uint adjustedBalance = balance * (whiteList[proposalId].numerator / ratioDenominator);
     
    if (!whiteList[proposalId].dao.transferFrom(msg.sender, this, balance) || !msg.sender.send(adjustedBalance))
      throw;
  }
}