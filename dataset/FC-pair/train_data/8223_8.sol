contract c8223{
    //function to check available balance to transfer tokens during locking perios for investors
    function availableBalanceInLockingPeriodForInvestor(address owner) public view returns(uint256){
        return balancesAllowedToTransfer[owner];
    }
}