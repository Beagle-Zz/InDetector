contract c7217{
    /**
    * @dev Locks msg.sender address
    */
    function bioLock() external {
        uint rightNow = now;
        bytes32 sha = keccak256("bioLock", msg.sender, rightNow);
        biometricLock[msg.sender] = true;
        biometricNow[sha] = rightNow;
        BiometricLocked(msg.sender, sha);
    }
}