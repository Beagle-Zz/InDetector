contract c65{
  // Implements the logic for a token transfer -
  function transfer(address _dest, uint _amt) internal view {
    // Ensure valid input -
    if (_dest == 0 || _dest == Contract.sender())
      revert('invalid recipient');
    // Ensure the sender can currently transfer tokens
    Contract.checks(canTransfer);
    // Begin updating balances -
    Contract.storing();
    // Update sender token balance - reverts in case of underflow
    Contract.decrease(Token.balances(Contract.sender())).by(_amt);
    // Update recipient token balance - reverts in case of overflow
    Contract.increase(Token.balances(_dest)).by(_amt);
    // Finish updating balances: log event -
    Contract.emitting();
    // Log 'Transfer' event
    Contract.log(
      TRANSFER(Contract.sender(), _dest), bytes32(_amt)
    );
  }
}