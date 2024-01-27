contract c7581{
    /**
     * @notice Collected fees sit here until they are distributed.
     * @dev The balance of the nomin contract itself is the fee pool.
     */
    function feePool()
        external
        view
        returns (uint)
    {
        return tokenState.balanceOf(FEE_ADDRESS);
    }
}