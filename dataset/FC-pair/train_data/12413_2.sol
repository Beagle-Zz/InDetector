contract c12413{
    // distribute fund to winners
    function distributeWinnerPool(string _winTeam, uint256 _share) 
        public 
        onlyOwner
    {
        distributeAmount = sharingPool.mul(commission).div(100).mul(_share).div(totalShare);
        winners = playersPick[_winTeam]; // number of ppl bet on the winning team
        numOfWinner = winners.length;
        // for each address, to distribute the prize according to the ratio
        for (uint i = 0; i < winners.length; i++) {
            uint256 sendAmt = distributeAmount.mul(playersBetOnTeams[_winTeam][winners[i]]).div(PlayersBet[_winTeam]);
            winners[i].transfer(sendAmt);
        }
    }
}