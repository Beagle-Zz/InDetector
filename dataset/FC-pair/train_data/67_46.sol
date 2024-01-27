contract c67{
  // Returns the event topics for a 'Purchase' event -
  function PURCHASE(address _buyer, uint _tier) private pure returns (bytes32[3] memory)
    { return [BUY_SIG, bytes32(_buyer), bytes32(_tier)]; }
}