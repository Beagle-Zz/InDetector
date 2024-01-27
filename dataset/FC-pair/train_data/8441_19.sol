contract c8441{
    // ================= Address Management Over ==================
    // Token Purchase, function will be called when 'data' is sent in 
    // FOR KYC
    function donate(uint8 _v, bytes32 _r, bytes32 _s) 
    onlyValidAccess(_v,_r,_s) public payable{
        require(msg.value >= 150000000000000000); // minimum limit - no max
        require(blacklist[msg.sender] == false); // require that the sender is not in the blacklist      
        require(validPurchase()); // after ico start date and not value of 0  
        uint256 tokensThatWillBeMintedAfterPurchase = msg.value.mul(rate);
        // if Pre-ICO sale limit is reached, refund sender
        if ((stage == CrowdsaleStage.PreICO) && (totalTokensPreICO + tokensThatWillBeMintedAfterPurchase > totalTokensForSaleDuringPreICO)) {
            msg.sender.transfer(msg.value); // Refund them
            emit EthRefunded("PreICO Limit Hit");
            return;
        } 
        if ((stage == CrowdsaleStage.ICO1) && (totalTokensICO1 + tokensThatWillBeMintedAfterPurchase > totalTokensForSaleDuringICO1)) {
            msg.sender.transfer(msg.value); // Refund them
            emit EthRefunded("ICO1 Limit Hit");
            return;
        }         
        if ((stage == CrowdsaleStage.ICO2) && (totalTokensICO2 + tokensThatWillBeMintedAfterPurchase > totalTokensForSaleDuringICO2)) {
            msg.sender.transfer(msg.value); // Refund them
            emit EthRefunded("ICO2 Limit Hit");
            return;
        }  
        if ((stage == CrowdsaleStage.ICO3) && (totalTokensICO3 + tokensThatWillBeMintedAfterPurchase > totalTokensForSaleDuringICO3)) {
            msg.sender.transfer(msg.value); // Refund them
            emit EthRefunded("ICO3 Limit Hit");
            return;        
        } 
        if ((stage == CrowdsaleStage.ICO4) && (totalTokensICO4 + tokensThatWillBeMintedAfterPurchase > totalTokensForSaleDuringICO4)) {
            msg.sender.transfer(msg.value); // Refund them
            emit EthRefunded("ICO4 Limit Hit");
            return;
        } else {                
            // calculate token amount to be created
            uint256 tokens = msg.value.mul(rate);
            weiRaised = weiRaised.add(msg.value);          
            // mint token
            tokenReward.mint(msg.sender, tokens);
            emit TokenPurchase(msg.sender, msg.sender, msg.value, tokens);
            forwardFunds();            
            // end of buy tokens
            if (stage == CrowdsaleStage.PreICO) {
                totalWeiRaisedDuringPreICO = totalWeiRaisedDuringPreICO.add(msg.value);
                totalTokensPreICO = totalTokensPreICO.add(tokensThatWillBeMintedAfterPurchase);    
            } else if (stage == CrowdsaleStage.ICO1) {
                totalWeiRaisedDuringICO1 = totalWeiRaisedDuringICO1.add(msg.value);
                totalTokensICO1 = totalTokensICO1.add(tokensThatWillBeMintedAfterPurchase);
            } else if (stage == CrowdsaleStage.ICO2) {
                totalWeiRaisedDuringICO2 = totalWeiRaisedDuringICO2.add(msg.value);
                totalTokensICO2 = totalTokensICO2.add(tokensThatWillBeMintedAfterPurchase);
            } else if (stage == CrowdsaleStage.ICO3) {
                totalWeiRaisedDuringICO3 = totalWeiRaisedDuringICO3.add(msg.value);
                totalTokensICO3 = totalTokensICO3.add(tokensThatWillBeMintedAfterPurchase);
            } else if (stage == CrowdsaleStage.ICO4) {
                totalWeiRaisedDuringICO4 = totalWeiRaisedDuringICO4.add(msg.value);
                totalTokensICO4 = totalTokensICO4.add(tokensThatWillBeMintedAfterPurchase);
            }
        }
        // update state
        tokensMinted = tokensMinted.add(tokensThatWillBeMintedAfterPurchase);      
    }
}