contract c10930{
  /**
   * @dev Executes the contract if called by an authorized user and the balance of the escrow
   * is greater than 0. If the Oracle contract's reported value is the expected value, payment
   * goes to the beneficiary. If the escrow contract has gone passed the expiration and the
   * Oracle contract's reported value still is not what is expected, payment is returned to
   * the depositor.
   */
  function executeContract() public checkAuthorizedUser() {
    require(address(this).balance > 0);
    if (oracle.current() == EXPECTED) {
      contractExecuted = true;
      emit ContractExecuted("Payment sent to beneficiary.");
      beneficiary.transfer(address(this).balance);
    } else if (now >= expiration) {
      contractExecuted = true;
      emit ContractExecuted("Payment refunded to depositor.");
      depositor.transfer(address(this).balance);
    }
  }
}