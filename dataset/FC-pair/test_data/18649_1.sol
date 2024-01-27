contract c18649{
     /* Has the minimum threshold been reached? */
    function icoThresholdReached() public constant returns (bool thresholdReached) {
        address myAddress = this;
        uint256 etherBalance = myAddress.balance;
        if (etherBalance < MIN_FUNDING_GOAL) return false;
        return true;
    }  
}