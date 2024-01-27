contract c10369{
    // Number of tokens that are still locked
    function getLockedBalance() public view onlyReserveWallets returns (uint256 tokensLocked) {
        return allocations[msg.sender].sub(claimed[msg.sender]);
    }
}