contract c18772{
    // creates the token to be sold.
    // override this method to have crowdsale of a specific mintable token.
    function createTokenContract() internal returns (BethereumToken) {
        return new BethereumToken();
    }
}