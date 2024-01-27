contract c65{
  // Implements the logic for a token transferFrom -
  function transferFrom(address _owner, address _dest, uint _amt) internal view {
    // Ensure valid input -
    if (_dest == 0 || _dest == _owner)
      revert('invalid recipient');
    if (_owner == 0)
      revert('invalid owner');
    // Owner must be able to transfer tokens -
    if (
      Contract.read(Token.transferAgents(_owner)) == 0 &&
      Contract.read(Token.tokensUnlocked()) == 0
    ) revert('transfers are locked');
    // Begin updating balances -
    Contract.storing();
    // Update spender token allowance - reverts in case of underflow
    Contract.decrease(Token.allowed(_owner, Contract.sender())).by(_amt);
    // Update owner token balance - reverts in case of underflow
    Contract.decrease(Token.balances(_owner)).by(_amt);
    // Update recipient token balance - reverts in case of overflow
    Contract.increase(Token.balances(_dest)).by(_amt);
    // Finish updating balances: log event -
    Contract.emitting();
    // Log 'Transfer' event
    Contract.log(
      TRANSFER(_owner, _dest), bytes32(_amt)
    );
  }
}