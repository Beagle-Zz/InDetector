contract c8451{
    /**
     * @dev Finish Crowdsale
     */
    function finish(address _bountyFund, address _advisorsFund, address _ecosystemFund, address _teamFund) public onlyOwner {
        require(_bountyFund != address(0));
        require(_advisorsFund != address(0));
        require(_ecosystemFund != address(0));
        require(_teamFund != address(0));
        emit Finalized();
        // unsold tokens to ecosystem (perhaps further they will be burnt)
        uint256 unsoldTokens = tokensForSale - token.totalSupply();
        if (unsoldTokens > 0) {
            tokensForEcosystem = tokensForEcosystem + unsoldTokens;
        }
        // distribute
        token.mint(_bountyFund,tokensForBounty);
        token.mint(_advisorsFund,tokensForAdvisors);
        token.mint(_ecosystemFund,tokensForEcosystem);
        token.mint(_teamFund,tokensForTeam);
        // finish
        token.finishMinting();
        // freeze team tokens
        token.setTeamAddress(_teamFund);
    }
}