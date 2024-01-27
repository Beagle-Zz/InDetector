contract c372{
    // --- Locked Section ---
    modifier hasntLockedBalance(address _checker) {
        require(lockedtype[_checker] == 0);
        _;
    }
}