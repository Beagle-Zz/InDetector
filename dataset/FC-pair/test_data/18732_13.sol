contract c18732{
    /**
    * allowed for a bounty manager account only
    */
    modifier onlyBountyManager(){
        require((msg.sender == bountyManagerDistributionContract) || (msg.sender == bountyManagerAddress));
        _;
    }
}