contract c13435{
    // public function that allows a token holder to manually trigger the latest lottery
    // this saves on gas and potential failures during the purchase of tokens
    function invokeLottery() public {
        require(tokenBalance[msg.sender] > 0);
        Lottery storage lotto = lotteries[lottoQueue];
        require(lotto.instantiated);
        require(!lotto.completed);
        require(!pendingOraclize);
        pendingOraclize = true;
        emit RandomRequested(lotto.identifier);
        // generate an oraclize query by calling wolfram alpha
        // both the min and the max are inclusive
        oraclize_query("WolframAlpha", "random number between 0 and 2");
    }
}