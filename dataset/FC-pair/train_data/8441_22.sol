contract c8441{
  // Finish: Mint Extra Tokens as needed before finalizing the Crowdsale.
  // ====================================================================
    function finish() public onlyOwner {
        require(!isFinalized);
        if(tokensMinted < totalTokensForSale) {
            uint256 unsoldTokens = totalTokensForSale - tokensMinted;            
            tokenReward.mint(community, unsoldTokens);
        }
        finalize();
    } 
}