contract c12524{
    /**
    * @notice contribution handler
    */
    function contribute() public notFinished payable {
        uint256 tokenBought = 0; //tokens bought variable
        totalRaised = totalRaised.add(msg.value); //ether received updated
        ethOnContract[msg.sender] = ethOnContract[msg.sender].add(msg.value); //ether sent by user updated
        //Rate of exchange depends on stage
        if (state == State.PreSale){
            require(now >= PreSaleStart);
            tokenBought = msg.value.mul(rates[0]);
            PreSaleDistributed = PreSaleDistributed.add(tokenBought); //Tokens sold on presale updated
            require(PreSaleDistributed <= PreSaleLimit);
        } else if (state == State.MainSale){
            require(now >= MainSaleStart);
            tokenBought = msg.value.mul(rates[1]);
        }
        totalDistributed = totalDistributed.add(tokenBought); //whole tokens sold updated
        require(totalDistributed <= hardCap);
        if(totalDistributed >= softCap){
            //if there are any unclaimed tokens
            uint256 tempBalance = balance[msg.sender];
            //clear pending balance
            balance[msg.sender] = 0;
            //If softCap is reached tokens are send immediately
            require(tokenReward.transfer(msg.sender, tokenBought.add(tempBalance)));
            //Tokens sent to user updated
            tokensSent[msg.sender] = tokensSent[msg.sender].add(tokenBought.add(tempBalance));
            emit LogContributorsPayout(msg.sender, tokenBought.add(tempBalance));
        } else{
            //If softCap is not reached tokens becomes pending
            balance[msg.sender] = balance[msg.sender].add(tokenBought);
        }
        emit LogFundingReceived(msg.sender, msg.value, totalRaised);
        checkIfFundingCompleteOrExpired();
    }
}