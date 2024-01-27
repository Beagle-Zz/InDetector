contract c10769{
    /**
	 * @dev get the Deposit records number
     *
     */
    function getDepositNum() public view returns (uint256) {
        return deposRecs.length;
    }
}