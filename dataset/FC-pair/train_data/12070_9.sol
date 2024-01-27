contract c12070{
    // Check if a given address is locked. The address can be in the whitelist or in the reward
    function isLocked(address addr) public view returns (bool) {
        // Main sale is running, any addr is locked
        if (mainSaleTokenLocked) {
            return true;
        } else {
            // Main sale is ended and thus any whitelist addr is unlocked
            if (isWhitelisted(addr)) {
                return false;
            } else {
                // If the addr is in the reward, it must be checked if locked
                // If the addr is not in the reward, it is considered unlocked
                return rewardTokenLocked[addr];
            }
        }
    }
}