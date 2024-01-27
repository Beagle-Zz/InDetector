contract c12991{
    // Choose a winner and pay him
    function payWinner() internal returns (address) {
        uint256 balance = address(this).balance;
        uint256 number = PRNG(); // generates a pseudorandom number
        address winner = entries[number]; // choose the winner with the pseudorandom number
        winner.transfer(balance); // payout winner
        entryCounter = 0; // Zero entries again => Lottery resetted
        emit WinnerPaid(balance, winner);
        return winner;
    }
}