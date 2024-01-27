contract c4842{
  // Allows owner to sweep any ETH somehow trapped in the contract.
  function sweep() onlyOwner public {
    owner.transfer(this.balance);
  }
}