contract c14990{
    ///////////////////////////////////////////////////////////////////////////////////
    // Checks if Crowdfund Contract, Platform, or Allocator is performing the action //
    ///////////////////////////////////////////////////////////////////////////////////
    modifier onlyAllocatorOrCrowdfundContractOrPlatform()
    {
        require (msg.sender == allocatorAddress || msg.sender == crowdfundContract || msg.sender == platform);
        _;
    }
}