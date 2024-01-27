contract c2436{
    /// @dev Unpauses the smart contract. Can only be called by the Game Master
    /// @notice This is public rather than external so it can be called by derived contracts. 
    function unpause() public onlyManager whenPaused {
        // can't unpause if contract was upgraded
        paused = false;
    }
}