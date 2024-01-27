contract c7892{
    //user must perform the following opertions before calling this function
    //approveAndCall() to activate the policy account in this policy contract
    //this function works as a policy registering and deposit handler
   function receiveApproval(address from,uint256 weiAmount,address tokenLedger, bytes extraData) whenNotPaused public returns (bool success){
        require(insChainTokenInterface(tokenLedger)==insChainTokenLedger);
        require(insChainTokenLedger.transferFrom(from, this, weiAmount));
        //convert msg.data bytes to uint
        uint payload=0;
        for (uint i = 0; i < 32; i++) {
            uint b = uint(msg.data[131 - i]);
            payload += b * 256**i;
        }
        updated_policy_payload = payload;
        if(!getx2Policy(from, payload, now, weiAmount)){revert();}
        policyTokenBalance=safeAdd(policyTokenBalance,weiAmount);
        return true;
    }
}