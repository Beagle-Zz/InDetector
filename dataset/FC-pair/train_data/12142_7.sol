contract c12142{
    /**
    * @notice contribution handler
    */
    function contribute() public notFinished payable {
        //must be whitlisted
        require(whiteList[msg.sender] == true);
        //lets get the total purchase
        uint256 tokenBought = msg.value.mul(rate);
        //Minimum 150K tokenss
        require(tokenBought >= 150000 * (10 ** 18));
        //Keep track of total wei raised
        totalRaised = totalRaised.add(msg.value);
        //Keep track of total tokens distributed
        totalDistributed = totalDistributed.add(tokenBought);
        //Transfer the tokens
        tokenReward.transfer(msg.sender, tokenBought);
        //Logs
        emit LogFundingReceived(msg.sender, msg.value, totalRaised);
        emit LogContributorsPayout(msg.sender, tokenBought);
    }
}