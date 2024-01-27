contract c10746{
    // returns CHUNK_SIZE locks of a given account, starting from some offset
    // lock products are encoded as
    //             [lockId, amountLocked, interestEarned, lockedUntil, perTermInterest, durationInSecs, isActive ]
    function getLocksForAddress(address lockOwner, uint offset) external view returns (uint[7][CHUNK_SIZE] response) {
        uint[] storage locksForAddress = accountLocks[lockOwner];
        for (uint16 i = 0; i < CHUNK_SIZE; i++) {
            if (offset + i >= locksForAddress.length) { break; }
            Lock storage lock = locks[locksForAddress[offset + i]];
            LockProduct storage lockProduct = lockProducts[lock.productId];
            uint interestEarned = calculateInterest(lockProduct.perTermInterest, lock.amountLocked);
            response[i] = [ locksForAddress[offset + i], lock.amountLocked, interestEarned, lock.lockedUntil,
                                lockProduct.perTermInterest, lockProduct.durationInSecs, lock.isActive ? 1 : 0 ];
        }
    }
}