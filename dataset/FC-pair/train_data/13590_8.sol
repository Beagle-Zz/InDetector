contract c13590{
    /**
    * @notice contribution handler
    */
    function contribute() public notFinishedOrHold payable {
        require(whiteList[msg.sender] == true); //User must be whitelisted
        require(msg.value >= 0.1 ether); //Minimal contribution
        uint256 tokenBought = 0; //tokens bought variable
        totalRaised = totalRaised.add(msg.value); //ether received updated
        ethOnContract[msg.sender] = ethOnContract[msg.sender].add(msg.value); //ether sent by user updated
        //Rate of exchange depends on stage
        if (state == State.PreSale){
            require(now >= PreSaleStart);
            tokenBought = msg.value.mul(rates[0]);
            PreSaleDistributed = PreSaleDistributed.add(tokenBought); //Tokens sold on presale updated
        } else if (state == State.MainSale){
            require(now >= MainSaleStart);
            if (now <= MainSaleStart.add(1 weeks)){
                tokenBought = msg.value.mul(rates[1]);
            } else if (now <= MainSaleStart.add(2 weeks)){
                tokenBought = msg.value.mul(rates[2]);
            } else if (now <= MainSaleStart.add(3 weeks)){
                tokenBought = msg.value.mul(rates[3]);
            } else tokenBought = msg.value.mul(rates[4]);
        }
        require(totalDistributed.add(tokenBought) <= hardCap);
        if(KYCValid[msg.sender] == true){
            //if there are any unclaimed tokens
            uint256 tempBalance = balance[msg.sender];
            //clear pending balance
            balance[msg.sender] = 0;
            //If KYC is valid tokens are send immediately
            require(tokenReward.transfer(msg.sender, tokenBought.add(tempBalance)));
            //Tokens sent to user updated
            tokensSent[msg.sender] = tokensSent[msg.sender].add(tokenBought.add(tempBalance));
            emit LogContributorsPayout(msg.sender, tokenBought.add(tempBalance));
        } else{
            //If KYC is not valid tokens becomes pending
            balance[msg.sender] = balance[msg.sender].add(tokenBought);
        }
        totalDistributed = totalDistributed.add(tokenBought); //whole tokens sold updated
        emit LogFundingReceived(msg.sender, msg.value, totalRaised);
        checkIfFundingCompleteOrExpired();
    }
}