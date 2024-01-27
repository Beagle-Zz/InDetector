contract c40104{
   
  function drain() only_owner {
    if (!msg.sender.send(this.balance)) {
      throw;
    }
  }
}