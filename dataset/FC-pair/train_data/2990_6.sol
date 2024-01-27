contract c2990{
    /**
     * @dev Return the amount of tokens claimable by a third party caller when generating a recipient's token allocation at a given block
     * @param _blockNumber Block at which to compute the amount of tokens claimable by a third party caller
     */
    function callerTokenAmountAtBlock(uint256 _blockNumber) public view returns (uint256) {
        if (_blockNumber < callerAllocationStartBlock) {
            // If the block is before the start of the caller allocation period, the third party caller can claim nothing
            return 0;
        } else if (_blockNumber >= callerAllocationEndBlock) {
            // If the block is at or after the end block of the caller allocation period, the third party caller can claim everything
            return tokensPerAllocation;
        } else {
            // During the caller allocation period, the third party caller can claim an increasing percentage
            // of the recipient's allocation based on a linear curve - as more blocks pass in the caller allocation
            // period, the amount claimable by the third party caller increases linearly
            uint256 blocksSinceCallerAllocationStartBlock = _blockNumber.sub(callerAllocationStartBlock);
            return tokensPerAllocation.mul(blocksSinceCallerAllocationStartBlock).div(callerAllocationPeriod);
        }
    }
}