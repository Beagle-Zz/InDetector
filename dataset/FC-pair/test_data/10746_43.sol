contract c10746{
    // returns 20 lock products starting from some offset
    // lock products are encoded as [ perTermInterest, durationInSecs, minimumLockAmount, maxLockAmount, isActive ]
    function getLockProducts(uint offset) external view returns (uint[5][CHUNK_SIZE] response) {
        for (uint8 i = 0; i < CHUNK_SIZE; i++) {
            if (offset + i >= lockProducts.length) { break; }
            LockProduct storage lockProduct = lockProducts[offset + i];
            response[i] = [ lockProduct.perTermInterest, lockProduct.durationInSecs, lockProduct.minimumLockAmount,
                        monetarySupervisor.getMaxLockAmount(lockProduct.minimumLockAmount, lockProduct.perTermInterest),
                        lockProduct.isActive ? 1 : 0 ];
        }
    }
}