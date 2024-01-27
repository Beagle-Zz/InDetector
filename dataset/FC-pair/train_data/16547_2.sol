contract c16547{
    /**
    * @notice contribution handler
    */
    function contribute() public notFinished payable {
        require(now >= startTime);
        uint256 tokenBought;
        //Variable to store amount of tokens bought
        uint256 tokenPrice = price.EUR(0);
        //1 cent value in wei
        totalRaised = totalRaised.add(msg.value);
        //Save the total eth totalRaised (in wei)
        tokenPrice = tokenPrice.mul(2);
        //0.02$ EUR value in wei
        tokenPrice = tokenPrice.div(10 ** 8);
        //Change base 18 to 10
        tokenBought = msg.value.div(tokenPrice);
        //Base 18/ Base 10 = Base 8
        tokenBought = tokenBought.mul(10 ** 10);
        //Base 8 to Base 18
        require(tokenBought >= 100 * 10 ** 18);
        //Minimum 100 base tokens
        //Bonus calculation
        if (state == State.Stage1) {
            tokenBought = tokenBought.mul(140);
            tokenBought = tokenBought.div(100);
            //+40%
        } else if (state == State.Stage2) {
            tokenBought = tokenBought.mul(120);
            tokenBought = tokenBought.div(100);
            //+20%
        }
        totalDistributed = totalDistributed.add(tokenBought);
        //Save to total tokens distributed
        tokenReward.transfer(msg.sender, tokenBought);
        //Send Tokens
        creator.transfer(msg.value);
        // Send ETH to creator
        emit LogBeneficiaryPaid(creator);
        //LOGS
        emit LogFundingReceived(msg.sender, msg.value, totalRaised);
        emit LogContributorsPayout(msg.sender, tokenBought);
        checkIfFundingCompleteOrExpired();
    }
}