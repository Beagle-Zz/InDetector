contract c10369{
    //Lock the vault for the wallets
    function lock() internal notLocked onlyOwner {
        lockedAt = block.timestamp;
        timeLocks[teamReserveWallet] = lockedAt.add(teamTimeLock);
        timeLocks[finalReserveWallet] = lockedAt.add(finalReserveTimeLock);
        Locked(lockedAt);
    }
}