contract c8613{
     /**
     * @dev to prolongate a deal for some days
     * @param _dealNumber - uniq number of deal
     * @param _days - count of days from current time
     */ 
    function changeDealDate(uint _dealNumber, uint _days) onlyAgency public{
        uint deal = dealNumbers[_dealNumber];
        require(deals[deal].isProlong);
        deals[deal].date = now + _days * 1 days;
    }
}