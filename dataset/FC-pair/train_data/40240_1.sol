contract c40240{
   
  function withdraw(uint proposalId) external {
     
    uint balance = whiteList[proposalId].balanceOf(msg.sender);
     
    if (!whiteList[proposalId].transferFrom(msg.sender, this, balance) || !msg.sender.send(balance))
      throw;
  }
}