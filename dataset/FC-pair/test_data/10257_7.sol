contract c10257{
    //@notice Allows a user to place Bet on the match
    function placeBet(uint index) public payable {
        require(msg.value >= minimumBetAmount);
        require(!stopMatchBetting);
        require(!matchCompleted);
        if(teams[0].bettingContribution[msg.sender] == 0 && teams[1].bettingContribution[msg.sender] == 0) {
            betters.push(msg.sender);
        }
        if (teams[index].bettingContribution[msg.sender] == 0) {
            teams[index].totalParticipants = teams[index].totalParticipants.add(1);
        }
        teams[index].bettingContribution[msg.sender] = teams[index].bettingContribution[msg.sender].add(msg.value);
        teams[index].ledgerBettingContribution[msg.sender] = teams[index].ledgerBettingContribution[msg.sender].add(msg.value);
        teams[index].totalAmount = teams[index].totalAmount.add(msg.value);
    }
}