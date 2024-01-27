contract c8293{
    // Deactivates voting
    function disableVoting() public onlyAdmin returns(bool succ){
        require(votingActive == true);
        require(frozen == false);
        votingActive = false;
        emit VotingOff(msg.sender);
        return true;
    }
}