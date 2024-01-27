contract c7949{
  // Callback from Oraclize
  function __callback(bytes32 queryId, string result, bytes proof) public canDetermineWinner {
    require(msg.sender == oraclize_cbAddress());
    // The Oracle must always return
    // an integer (either 0 or 1, or if not then)
    // it should be 2
    if (keccak256(result) != keccak256("0") && keccak256(result) != keccak256("1")) {
      // Reschedule winner determination,
      // unless we're past the point of
      // cancelation. If nextScheduledQuery is
      // not the current query, it means that
      // there's a scheduled future query, so
      // we can wait for that instead of scheduling
      // another one now (otherwise this would cause
      // dupe queries).
      if (now >= CANCELATION_DATE) {
        cancel();
      }
      else if (nextScheduledQuery == queryId) {
        callOracle(PING_ORACLE_INTERVAL, ORACLIZE_GAS);
      }
    }
    else {
      setWinner(parseInt(result));
    }
  }
}