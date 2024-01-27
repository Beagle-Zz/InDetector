contract c1749{
    // In the event of a game restart, subtract the tokens which were being played for from the balance,
    //   transfer them to the winner (if the number of tokens is greater than zero: sly edge case).
    // If there is *somehow* any Ether in the contract - again, please don't - it is transferred to the
    //   bankroll and reinvested into Zethr at the standard 33% rate.
    function _settleAndRestart() private {
        gameActive      = false;
        uint payment = tokensInPlay/2;
        contractBalance = contractBalance.sub(payment);
        if (tokensInPlay > 0) { ZTHTKN.transfer(currentWinner, payment);
            if (address(this).balance > 0){
                ZTHBANKROLL.transfer(address(this).balance);
            }}
        emit GameEnded(currentWinner, payment, now);
        // Reset values.
        tokensInPlay  = tokensInPlay.sub(payment);
        gameActive    = true;
    }
}