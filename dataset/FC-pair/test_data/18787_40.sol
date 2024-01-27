contract c18787{
    /**
    * @dev Can be overridden to add finalization logic. The overriding function
    * should call super.finalization() to ensure the chain of finalization is
    * executed entirely.
    */
    function finalization() internal {
        //DAGT gets 20% of the amount of the total token supply
        uint256 totalSupply = token.totalSupply();
        // // total remaining Tokens
        //MintableToken token = MintableToken(token);
        MintableToken(token).mint(remainingTokensWallet,MAX_TOKENS.sub(totalSupply));
        MintableToken(token).finishMinting();
        //===================================================================
        super.finalization();
    }
}