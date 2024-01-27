contract c2727{
    // If, for any reason, betting needs to be paused (very unlikely), this will freeze all bets.
    function pauseGame() public onlyOwner {
        gameActive = false;
    }
}