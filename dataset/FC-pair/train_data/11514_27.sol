contract c11514{
    /**
	 * @dev get the one of the withdraw records
     *
     * @param _ind the withdraw record index
     */
    function getOneWithdrawRec(uint256 _ind) public view returns (uint256, address, uint256) {
        require(_ind < withdrRecs.length);
        return (withdrRecs[_ind].timeStamp, withdrRecs[_ind].account, withdrRecs[_ind].value);
    }
}