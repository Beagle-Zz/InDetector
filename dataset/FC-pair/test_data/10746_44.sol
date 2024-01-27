contract c10746{
    // returns CHUNK_SIZE locks starting from some offset
    // lock products are encoded as
    //       [lockId, owner, amountLocked, interestEarned, lockedUntil, perTermInterest, durationInSecs, isActive ]
    // NB: perTermInterest is in millionths (i.e. 1,000,000 = 100%):
    function getLocks(uint offset) external view returns (uint[8][CHUNK_SIZE] response) {
        for (uint16 i = 0; i < CHUNK_SIZE; i++) {
            if (offset + i >= locks.length) { break; }
            Lock storage lock = locks[offset + i];
            LockProduct storage lockProduct = lockProducts[lock.productId];
            uint interestEarned = calculateInterest(lockProduct.perTermInterest, lock.amountLocked);
            response[i] = [uint(offset + i), uint(lock.owner), lock.amountLocked, interestEarned, lock.lockedUntil,
                                lockProduct.perTermInterest, lockProduct.durationInSecs, lock.isActive ? 1 : 0];
        }
    }
}