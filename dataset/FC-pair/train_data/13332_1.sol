contract c13332{
    /**
     * Utility internal function used to safely transfer `value1` tokens `from` -> `to1`, and `value2` tokens
     * `from` -> `to2`, minimizing gas usage (calling `internalTransfer` twice is more expensive). Throws if
     * transfers are impossible.
     */
    function internalDoubleTransfer (address from, address to1, uint value1, address to2, uint value2) internal {
        require( // Prevent people from accidentally burning their tokens + uint256 wrap prevention
            to1 != 0x0 && to2 != 0x0 && value1 + value2 >= value1 && balanceOf[from] >= value1 + value2
            && balanceOf[to1] + value1 >= balanceOf[to1] && balanceOf[to2] + value2 >= balanceOf[to2]
        );
        balanceOf[from] -= value1 + value2;
        balanceOf[to1] += value1;
        emit Transfer(from, to1, value1);
        if (value2 > 0) {
            balanceOf[to2] += value2;
            emit Transfer(from, to2, value2);
        }
    }
}