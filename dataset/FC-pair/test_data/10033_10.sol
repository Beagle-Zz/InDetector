contract c10033{
  /**
   * @dev Transfer accrued commission to verifier's address.
   * @return True if success.
   */
  function withdrawCommission()
                        public
                        whenNotPaused
    returns(bool success)
  {
    uint commissionToTransfer = commissionToWithdraw;
    commissionToWithdraw = 0;
    owner.transfer(commissionToTransfer); // owner is verifier
    emit LogWithdrawCommission(commissionToTransfer);
    return true;
  }
}