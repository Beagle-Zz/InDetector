contract c7696{
    // Voter requirements:
    modifier onlyVoter {
        require(votingActive == true);
        require(bitmask_check(msg.sender, 4) == true); //passed KYC
        require(bitmask_check(msg.sender, 1024) == false); // banned == false
        require((accounts[msg.sender].lastVotedBallotId < curentBallotId)); 
        _;
    }
}