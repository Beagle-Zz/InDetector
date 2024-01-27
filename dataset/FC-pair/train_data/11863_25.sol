contract c11863{
    /**
	 * @dev get the one of the Deposit records
     *
     * @param _ind the deposit record index
     */
    function getOneDepositRec(uint256 _ind) public view returns (uint256, address, uint256) {
        require(_ind < deposRecs.length);
        return (deposRecs[_ind].timeStamp, deposRecs[_ind].account, deposRecs[_ind].value);
    }
}