contract c3554{
    // Deactivates voting
    function disableVoting() public onlyAdmin returns(uint winner){
        require(votingActive == true);
        require(frozen == false);
        votingActive = false;
        curentWinner = winningProject();
        addWinner(curentWinner);
        emit VotingOff(curentWinner, curentBallotId);
        return curentWinner;
    }
}