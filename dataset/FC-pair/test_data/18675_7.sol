contract c18675{
    /*
     * @dev     Function returns bool re whether or not address in question 
     *          has claimed promo LOT for the week in question.
     *
     * @param _address  Ethereum address to be queried
     * @param _weekNo   Week number to be queried (use 0 for current week)
     */
    function hasRedeemed(address _address, uint _weekNo) public view returns (bool) {
        uint week = _weekNo == 0 ? getWeek() : _weekNo;
        return claimed[_address][week];
    }
}