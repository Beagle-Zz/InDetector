contract c8293{
    // Activates voting
    // requires round = 9
    function enableVoting() public onlyAdmin returns(bool succ){ 
        require(votingActive == false);
        require(frozen == false);
        require(round == 9);
        votingActive = true;
        emit VotingOn(msg.sender);
        return true;
    }
}