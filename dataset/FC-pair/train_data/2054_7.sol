contract c2054{
    // if the ICO is finished and the goal has been reached, this function will be used to mint and transfer BTNT tokens to each contributor
    function grantContributorTokens(address contributor) public returns (bool) {
        require(!hasClaimedTokens[contributor]);
        require(crowdsale.creditOf(contributor) > 0);
        require(whitelist.AMLWhitelisted(contributor));
        require(now > ICOEndTime);
        assert(token.mint(contributor, crowdsale.creditOf(contributor)));
        hasClaimedTokens[contributor] = true;
        return true;
    }
}