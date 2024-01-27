contract c1611{
    /**
     * @dev Returns tokens available for transfer for a specified address
     * @param _of The address to query the the lock tokens of
     */
    function transferableBalanceOf(address _of)
        public
        view
        returns (uint256 amount)
    {
        uint256 lockedAmount = 0;
        lockedAmount += tokensLocked(_of, block.timestamp);
        amount = balances[_of].sub(lockedAmount);
    }
}