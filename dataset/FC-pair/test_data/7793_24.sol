contract c7793{
    /** AutoCoinToken Contract */
    function createTokenContract() internal returns (MintableToken) {
        return new AutoCoinToken();
    }
}