contract c14407{
  ////////////////
  // Admin actions
  ////////////////
  function withdrawContractBalance() external onlyOwner {
    uint256 contractBalance = address(this).balance;
    uint256 withdrawableBalance = contractBalance.sub(totalPayments);
    // No withdrawal necessary if <= 0 balance
    require(withdrawableBalance > 0);
    msg.sender.transfer(withdrawableBalance);
  }
}