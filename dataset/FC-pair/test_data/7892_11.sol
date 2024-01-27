contract c7892{
    //the policy balance ledger will be updated either
    // onlyOwner might be changed to onlyManager later
    function withdrawPolicy(uint256 payload, uint256 weiAmount, uint256 fees, address to) public onlyOwner returns (bool success) {
        uint id=policyInternalID[payload];
        require(id>0);
        require(policies[id].accumulatedIn>0);
        require(policies[id].since<now);
        require(weiAmount<policyTokenBalance);
        if(!insChainTokenLedger.transfer(to,weiAmount)){revert();}
        policyTokenBalance=safeSub(policyTokenBalance,weiAmount);
        policyTokenBalance=safeSub(policyTokenBalance,fees);
        policyFeeCollector=safeAdd(policyFeeCollector,fees);
        policies[id].accumulatedIn=0;
        policies[id].since=now;
        emit PolicyOut(to, weiAmount, payload);
        policyActiveNum--;
        return true;
    }
}