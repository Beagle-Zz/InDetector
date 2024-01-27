contract c16764{
    /*
     * Modifier to check current round is sane as expected round
     *
     * @param expectedRound: Expected current round
     */
    modifier atRound(SaleRounds expectedRound) {
        require(round == expectedRound);
        _;
    }
}