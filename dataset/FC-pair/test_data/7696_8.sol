contract c7696{
    // Vote for proj. using id: _id
    function vote(uint _id) public onlyVoter returns(bool success){
        require(frozen == false);
        for (uint p = 0; p < projects.length; p++){
            if(projects[p].id == _id && projects[p].active == true){
                projects[p].votesWeight += sqrt(accounts[msg.sender].balance);
                accounts[msg.sender].lastVotedBallotId = curentBallotId;
            }
        }
        emit Vote(msg.sender, _id, accounts[msg.sender].balance, curentBallotId);
        return true;
    }
}