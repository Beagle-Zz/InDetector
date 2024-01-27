contract c18255{
  // Oraclize callback. Returns result from the computation datasource.
  function __callback(bytes32 myid, string result) {
    require(msg.sender == oraclize_cbAddress());
    uint256 winnerID = parseInt(result);
    require(winnerID > 0);
    require(winnerID <= NUMBER_OF_COUNTRIES);
    countryWinnerID = winnerID;
    WinnerAnnounced(countryWinnerID);
  }
}