contract c1749{
    // First, we check to see if the tokens are ZTH tokens. If not, we revert the transaction.
    // Next - if the game has already ended (i.e. your bet was too late and the clock ran out)
    //   the staked tokens from the previous game are transferred to the winner, the timers are
    //   reset, and the game begins anew.
    // If you're simply resetting the clock, the timers are reset accordingly and you are designated
    //   the current winner. A 1% cut will be taken for the house, and the rest deposited in the prize
    //   pool which everyone will be playing for. No second place prizes here!
    function _stakeTokens(TKN _tkn) private {
        require(gameActive); 
        require(_zthToken(msg.sender));
        require(validTokenBet[_tkn.value]);
        if (now > gameEnds) { _settleAndRestart(); }
        address _customerAddress = _tkn.sender;
        uint    _wagered         = _tkn.value;
        uint rightNow      = now;
        uint timePurchased = tokenToTimer[_tkn.value];
        uint newGameEnd    = rightNow.add(timePurchased);
        gameStarted   = rightNow;
        gameEnds      = newGameEnd;
        currentWinner = _customerAddress;
        contractBalance = contractBalance.add(_wagered);
        uint houseCut   = _wagered.div(100);
        uint toAdd      = _wagered.sub(houseCut);
        houseTake       = houseTake.add(houseCut);
        tokensInPlay    = tokensInPlay.add(toAdd);
        emit TokensWagered(_customerAddress, _wagered, newGameEnd);
    }
}