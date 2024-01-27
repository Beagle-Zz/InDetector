contract c16105{
    /**
     * @dev modifier to allow actions only when Pre-ICO end date is now
     */
    modifier isFinished() {
        require(now >= endDate);
        _;
    }
}