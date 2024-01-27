contract c10773{
    /* lock funds, called from AugmintToken's transferAndNotify
     Flow for locking tokens:
        1) user calls token contract's transferAndNotify lockProductId passed in data arg
        2) transferAndNotify transfers tokens to the Lock contract
        3) transferAndNotify calls Lock.transferNotification with lockProductId
    */
    function transferNotification(address from, uint256 amountToLock, uint _lockProductId) external {
        require(msg.sender == address(augmintToken), "msg.sender must be augmintToken");
        // next line would revert but require to emit reason:
        require(lockProductId < lockProducts.length, "invalid lockProductId");
        uint32 lockProductId = uint32(_lockProductId);
        require(lockProductId == _lockProductId, "lockProductId overflow");
        _createLock(lockProductId, from, amountToLock);
    }
}