contract c16364{
    /**
     * @dev Check if we are in the lock period of the current round
     */
    function currentRoundLocked() public view returns (bool) {
        uint256 lockedBlocks = MathUtils.percOf(roundLength, roundLockAmount);
        return blockNum().sub(currentRoundStartBlock()) >= roundLength.sub(lockedBlocks);
    }
}