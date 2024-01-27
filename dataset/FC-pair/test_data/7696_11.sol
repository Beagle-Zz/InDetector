contract c7696{
    // Deactivates voting
    function disableVoting() public onlyAdmin returns(uint winner){
        require(votingActive == true);
        require(frozen == false);
        votingActive = false;
        curentWinner = winningProject();
        addWinner(curentWinner);
        emit VotingOff(curentWinner);
        return curentWinner;
    }
}