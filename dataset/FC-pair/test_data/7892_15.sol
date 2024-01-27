contract c7892{
    // admin function to transfer in the GETX according to the rate
    // the admin should transfer "policyTokenBalanceFromEther" to this pool later
    function settleEtherPolicy(address[] froms, uint256[] payloads, uint256[] timeStamps, uint256[] weiAmounts) onlyOwner public returns(bool success){
        require(froms.length == payloads.length);
        require(payloads.length == weiAmounts.length);
        uint i;
        for (i=0;i<froms.length;i++){
            if(!getx2Policy(froms[i], payloads[i], timeStamps[i], weiAmounts[i])){revert();}
            // this GETX value must be the same as the ether collector account
            policyTokenBalanceFromEther=safeAdd(policyTokenBalanceFromEther,weiAmounts[i]);
            policyTokenBalance=safeAdd(policyTokenBalance,weiAmounts[i]);
            if(!insChainTokenLedger.transferFrom(msg.sender, this, weiAmounts[i])){revert();}
        }
        return true;
    }
}