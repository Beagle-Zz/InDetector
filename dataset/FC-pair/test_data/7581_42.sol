contract c7581{
    /* ========== VIEW FUNCTIONS ========== */
    /**
     * @notice A simple alias to totalVestedAccountBalance: provides ERC20 balance integration.
     */
    function balanceOf(address account)
        public
        view
        returns (uint)
    {
        return totalVestedAccountBalance[account];
    }
}