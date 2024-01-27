contract c18259{
    /**
     * @dev Disable transfer limit manually. Can be called only by manager
     */
    function disableLimit() public onlyManager {
        isLimitEnabled = false;
    }
}