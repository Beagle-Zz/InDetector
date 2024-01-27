contract c18499{
  // Override this method to have a way to add business logic to your crowdsale when buying
  function getTokenAmount(uint256 centValue) internal view returns(uint256) {
    return centValue.mul(rate);
  }
}