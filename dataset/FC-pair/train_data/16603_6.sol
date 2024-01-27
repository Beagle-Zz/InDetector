contract c16603{
    /**
    * @notice contribution handler
    */
    function contribute() public notFinished payable {
        require(now >= startTime);
        uint256 tokenBought;
        totalRaised = totalRaised.add(msg.value);
        if (now < startTime.add(15 days)){
            tokenBought = msg.value.mul(rates[0]);
        } else {
            tokenBought = msg.value.mul(rates[1]);
        }
        totalDistributed = totalDistributed.add(tokenBought);
        tokenReward.transfer(msg.sender, tokenBought);
        emit LogFundingReceived(msg.sender, msg.value, totalRaised);
        emit LogContributorsPayout(msg.sender, tokenBought);
        checkIfFundingCompleteOrExpired();
    }
}