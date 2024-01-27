contract c16373{
    /**
     * @dev Deposit ETH to this contract. Only callable by the currently registered Minter or JobsManager
     */
    function depositETH() external payable onlyMinterOrJobsManager whenSystemNotPaused returns (bool) {
        return true;
    }
}