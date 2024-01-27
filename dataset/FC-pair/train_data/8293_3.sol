contract c8293{
    // Voter requirements:
    modifier onlyVoter {
        require(votingActive == true);
        require(bitmask_check(msg.sender, 4) == true); //passed KYC
        //require((accounts[msg.sender].balance >= 100000000), "must have >= 1 NOM");
        require((accounts[msg.sender].lastVotedEpoch < epoch));
        require(bitmask_check(msg.sender, 1024) == false); // banned == false
        _;
    }
}