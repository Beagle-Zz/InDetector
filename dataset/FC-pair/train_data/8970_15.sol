contract c8970{
    /// @notice send lockedTokens to devs address
    /// require State == Success
    /// require tokens unlocked
    function releaseLockedToken() external {
        require (getState() == State.Success);
        require (balanceOf[lockedTokenHolder] > 0x0);
        require (block.number >= unlockedAtBlockNumber);
        balanceOf[devsHolder] = safeAdd(balanceOf[devsHolder],balanceOf[lockedTokenHolder]);
        emit Transfer(lockedTokenHolder,devsHolder,balanceOf[lockedTokenHolder]);
        balanceOf[lockedTokenHolder] = 0;
    }
}