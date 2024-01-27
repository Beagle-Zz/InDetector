contract c40345{
   
  function refund(uint proposalId) {
     
    uint balance = whiteList[proposalId].balanceOf(msg.sender);
     
    if (!whiteList[proposalId].transferFrom(msg.sender, this, balance) || !msg.sender.send(balance))
      throw;
  }
}