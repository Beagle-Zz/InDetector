contract c13590{
    /**
    * @notice Failure handler
    */
    function refund() public { //On failure users can get back their eth
        //If funding fail
        require(state == State.Failed);
        //Users have 90 days to claim a refund
        if (now < completedAt.add(90 days)){
            //We take the amount of tokens already sent to user
            uint256 holderTokens = tokensSent[msg.sender];
            //For security it's cleared            
            tokensSent[msg.sender] = 0;
            //Also pending tokens are cleared
            balance[msg.sender] = 0;
            //Amount of ether sent by user is checked
            uint256 holderETH = ethOnContract[msg.sender];
            //For security it's cleared            
            ethOnContract[msg.sender] = 0;
            //Contract try to retrieve tokens from user balance using allowance
            require(tokenReward.transferFrom(msg.sender,address(this),holderTokens));
            //If successful, send ether back
            msg.sender.transfer(holderETH);
            emit LogRefund(msg.sender,holderETH);
        } else{
            //After 90 days period only a master admin can use the function
            require(level[msg.sender] >= 2);
            //To claim remanent tokens on contract
            uint256 remanent = tokenReward.balanceOf(this);
            //And ether
            creator.transfer(address(this).balance);
            tokenReward.transfer(creator,remanent);
            emit LogBeneficiaryPaid(creator);
            emit LogContributorsPayout(creator, remanent);
        }
    }
}