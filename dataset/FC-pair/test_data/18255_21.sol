contract c18255{
  // In case of an emergency situation or other unexpected event an owner of the contract can explicitly enable refunds.
  function enableRefunds() external onlyOwner { 
    require(!refundsEnabled);
    require(!winnerConfirmed);
    refundsEnabled = true;
    RefundsEnabled();
  }
}