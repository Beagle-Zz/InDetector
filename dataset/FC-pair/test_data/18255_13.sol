contract c18255{
  // If the Oraclize didn't return the result in 30 mins during the last 24 hours, owner can announce the winner manually.
  function announceWinnerManually(uint256 winnerID) external validCountry(winnerID) possibleToAnnounceWinner onlyOwner {
    require(attemptsToQueryInLast24Hours >= MIN_NUMBER_OF_ATTEMPTS_TO_WAIT);
    require(now >= lastQueryTime.add(MIN_CALLBACK_WAIT_TIME));
    countryWinnerID = winnerID;
    WinnerAnnounced(countryWinnerID);
  }
}