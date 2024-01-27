contract c8899{
	 /**
     * @dev modifier to allow actions only when ICO end date is not now
     */
	modifier isRunning {
        require (endDate >= now);
        _;
    }
}