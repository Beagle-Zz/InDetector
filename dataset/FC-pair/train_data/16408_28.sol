contract c16408{
    /**
     * Overrides the Crowdsale.createTokenContract to create a CAK token
     * instead of a default MintableToken.
     */
    function createTokenContract() internal returns (MintableToken) {
        return new CakToken();
    }
}