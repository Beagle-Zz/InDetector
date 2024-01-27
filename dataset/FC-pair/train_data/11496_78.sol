contract c11496{
  // @dev Transfer deposit (with the allowance pattern.)
  function transferDeposit(uint256 _amount)
    whenNotPaused
    public
  {
    require(goldContract.allowance(msg.sender, this) >= _amount);
    // Send msg.sender's Gold to this contract.
    if (goldContract.transferFrom(msg.sender, this, _amount)) {
       // Increment deposit.
      addressToGoldDeposit[msg.sender] += _amount;
    }
  }
}