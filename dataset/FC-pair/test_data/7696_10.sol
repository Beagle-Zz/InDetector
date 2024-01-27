contract c7696{
    // Activates voting
    // Clears projects
    function enableVoting() public onlyAdmin returns(uint ballotId){ 
        require(votingActive == false);
        require(frozen == false);
        curentBallotId++;
        votingActive = true;
        delete projects;
        emit VotingOn(curentBallotId);
        return curentBallotId;
    }
}