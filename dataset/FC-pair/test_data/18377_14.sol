contract c18377{
  // transfer balance to owner
  function withdrawEther() onlyOwner public {
      owner.transfer(this.balance);
  }
}