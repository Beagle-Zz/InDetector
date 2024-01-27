contract c10864{
    // ===========================
    // Finish: Mint Extra Tokens as needed before finalizing the Crowdsale.
    // ====================================================================
    function finish(address _ecosystemFund) public onlyOwner {
        require(!isFinalized);
        uint256 alreadyMinted = token.totalSupply();
        require(alreadyMinted < maxTokens);
        uint256 unsoldTokens = totalTokensForSale - alreadyMinted;
        if (unsoldTokens > 0) {
            tokensForEcosystem = tokensForEcosystem + unsoldTokens;
        }
        token.mint(_ecosystemFund,tokensForEcosystem);
        finalize();
    }
}