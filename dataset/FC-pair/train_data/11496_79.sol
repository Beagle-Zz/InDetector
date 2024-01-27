contract c11496{
  // @dev Withdraw deposit.
  function withdrawDeposit(uint256 _amount)
    public
  {
    require(addressToGoldDeposit[msg.sender] >= _amount);
    // Send deposit of Golds to msg.sender. (Rather minting...)
    if (goldContract.transfer(msg.sender, _amount)) {
      // Decrement deposit.
      addressToGoldDeposit[msg.sender] -= _amount;
    }
  }
}