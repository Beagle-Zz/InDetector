contract c12991{
    // Admin can call the payWinner (ends lottery round & starts a new one) if it takes too long to reach the threshold
    function payWinnerManually() public onlyOwner() returns (address) {
        address winner = payWinner();
        return winner;
    }
}