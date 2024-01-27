contract c70{
  // Returns the event topics for a 'Purchase' event -
  function PURCHASE(bytes32 _exec_id, uint _current_rate) private view returns (bytes32[4] memory)
    { return [BUY_SIG, _exec_id, bytes32(_current_rate), bytes32(now)]; }
}