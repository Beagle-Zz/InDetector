contract c10746{
    // Internal function. assumes amountToLock is already transferred to this Lock contract
    function _createLock(uint32 lockProductId, address lockOwner, uint amountToLock) internal returns(uint lockId) {
        LockProduct storage lockProduct = lockProducts[lockProductId];
        require(lockProduct.isActive, "lockProduct must be in active state");
        require(amountToLock >= lockProduct.minimumLockAmount, "amountToLock must be >= minimumLockAmount");
        uint interestEarned = calculateInterest(lockProduct.perTermInterest, amountToLock);
        uint expiration = now.add(lockProduct.durationInSecs);
        uint40 lockedUntil = uint40(expiration);
        require(lockedUntil == expiration, "lockedUntil overflow");
        lockId = locks.push(Lock(amountToLock, lockOwner, lockProductId, lockedUntil, true)) - 1;
        accountLocks[lockOwner].push(lockId);
        monetarySupervisor.requestInterest(amountToLock, interestEarned); // update KPIs & transfer interest here
        emit NewLock(lockOwner, lockId, amountToLock, interestEarned, lockedUntil, lockProduct.perTermInterest,
                    lockProduct.durationInSecs);
    }
}