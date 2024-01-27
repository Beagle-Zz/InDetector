contract c18627{
  // transfer balance to owner
  function withdrawEther() onlyOwner public {
      owner.transfer(this.balance);
  }
}