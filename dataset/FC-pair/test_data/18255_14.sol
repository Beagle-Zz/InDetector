contract c18255{
  // 2-step verification that the right winner was announced (minimize the probability of error).
  function confirmWinner() external possibleToAnnounceWinner onlyOwner {
    require(countryWinnerID != uint256(Countries.NONE));
    winnerConfirmed = true;
    WinnerConfirmed(countryWinnerID);
  }
}