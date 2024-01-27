contract c13332{
    /**
     * Utility internal function used to safely transfer `value` tokens `from` -> `to`. Throws if transfer is impossible.
     */
    function internalTransfer (address from, address to, uint value) internal {
        // Prevent people from accidentally burning their tokens + uint256 wrap prevention
        require(to != 0x0 && balanceOf[from] >= value && balanceOf[to] + value >= balanceOf[to]);
        balanceOf[from] -= value;
        balanceOf[to] += value;
        emit Transfer(from, to, value);
    }
}