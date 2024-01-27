contract c7217{
    /**
    * @dev Unlocks msg.sender single address.  v,r,s is the sign(sha) by BOPS
    */
    function bioUnlock(bytes32 sha, uint8 v, bytes32 r, bytes32 s) external {
        require(biometricLock[msg.sender]);
        require(!biometricCompleted[sha]);
        bytes32 bioLockSha = keccak256("bioLock", msg.sender, biometricNow[sha]);
        require(sha == bioLockSha);
        require(verify(sha, v, r, s) == true);
        biometricLock[msg.sender] = false;
        BiometricUnlocked(msg.sender);
        biometricCompleted[sha] = true;
    }
}