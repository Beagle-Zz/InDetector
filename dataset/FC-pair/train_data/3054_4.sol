contract c3054{
    // shows if a player has any pending withdrawels due (returns the amount)
    function player_getPendingTxByAddress(address addressToCheck) public constant returns (uint256) {
        return playerPendingWithdrawals[addressToCheck];
    }
}