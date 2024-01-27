contract c2198{
    /**
     * return the players who won the game
     **/
    function getWinnerAddressList() public isEnded view returns (address[]) {
      if (winnerSide == 1) {
        return option1AddressList;
      }else {
        return option2AddressList;
      }
    }
}