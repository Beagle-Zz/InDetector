contract c10036{
    /**
    * function to change the start timestamp of the ico
    * can only be called by owner wallet
    **/
    function changeStartDate(uint256 startTimeUnixTimestamp) public onlyOwner{
        startTime = startTimeUnixTimestamp;
    }
}