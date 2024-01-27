contract c13590{
    /**
    * @notice function to let admin claim tokens on behalf users
    */
    function claimTokensByAdmin(address _target) onlyAdmin(1) public {
        //User must have a valid KYC
        require(KYCValid[_target] == true);
        //Tokens pending are taken
        uint256 tokens = balance[_target];
        //For safety, pending balance is cleared
        balance[_target] = 0;
        //Tokens are send to user
        require(tokenReward.transfer(_target, tokens));
        //Tokens sent to user updated
        tokensSent[_target] = tokensSent[_target].add(tokens);
        emit LogContributorsPayout(_target, tokens);       
    }
}