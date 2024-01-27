contract c10769{
    /**
	 * @dev get the withdraw records number
     *
     */
    function getWithdrawNum() public view returns (uint256) {
        return withdrRecs.length;
    }
}