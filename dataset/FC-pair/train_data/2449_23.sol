contract c2449{
    /** HazzaToken Contract */
    function createTokenContract() internal returns (MintableToken) {
        return new HazzaToken();
    }
}