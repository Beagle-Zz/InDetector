contract c18718{
    /**
     * @dev override token creation to set token address in constructor.
     */
    function createTokenContract() internal returns (MintableToken) {
        return MintableToken(0);
    }
}