contract c3554{
    // Shows currently winning proj 
    function winningProject() public constant returns (uint _winningProject){
        uint winningVoteWeight = 0;
        for (uint p = 0; p < projects.length; p++) {
            if (projects[p].votesWeight > winningVoteWeight && projects[p].active == true) {
                winningVoteWeight = projects[p].votesWeight;
                _winningProject = projects[p].id;
            }
        }
    }
}