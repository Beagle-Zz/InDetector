contract c18675{
    /*
     * @dev     Returns number of entries made in Etheraffle contract by
     *          function caller in whatever the queried week is. 
     *
     * @param _address  Address to be queried
     * @param _weekNo   Desired week number. (Use 0 for current week)
     */
    function getNumEntries(address _address, uint _weekNo) public view returns (uint) {
        uint week = _weekNo == 0 ? getWeek() : _weekNo;
        return etheraffleContract.getUserNumEntries(_address, week);
    }
}