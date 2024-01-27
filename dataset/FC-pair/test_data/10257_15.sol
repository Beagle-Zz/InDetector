contract c10257{
    //@notice Creates a match with given team names, minimum bet amount and a match number
    function createMatch(string teamA, string teamB, uint _minimumBetAmount, uint _matchNumber) public onlyOwner{
        address matchBetting = new MatchBetting(teamA, teamB, _minimumBetAmount, msg.sender, jackpotAddress, _matchNumber);
        deployedMatches.push(matchBetting);
    }
}