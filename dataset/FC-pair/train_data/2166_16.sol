contract c2166{
    /**
     * @dev Default transferable tokens function returns all tokens for a holder (no limit).
     * @dev Overwriting transferableTokens(address holder, uint64 time) is the way to provide the
     * specific logic for limiting token transferability for a holder over time.
     */
    function transferableTokens(address holder, uint64 time) public constant returns (uint256) {
        return balanceOf(holder);
    }
}