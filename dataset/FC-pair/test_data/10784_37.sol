contract c10784{
    /**
    * @dev Can be overridden to add finalization logic. The overriding function
    * should call super.finalization() to ensure the chain of finalization is
    * executed entirely.
    */
    function finalization() internal {
        uint256 totalSupply_ = CROWDSALE_TOKENS_NUMS;
        uint256 totalSale_ = token.totalCrowdSale();
        // // total remaining Tokens
        // MintableToken token = MintableToken(token);
        token.mint(FOUNDER_WALET,totalSupply_.sub(totalSale_));
        token.finishMinting();
        super.finalization();
    }
}