contract c7487{
    /// By default, we dis-allow payment disburements if the contract is paused.
    /// However, to facilitate a migration of the bridge, we can allow
    /// disbursements when paused if explicitly set
    modifier disbursementsAllowed {
        require(!paused || allowDisbursePaymentWhenPaused);
        _;
    }
}