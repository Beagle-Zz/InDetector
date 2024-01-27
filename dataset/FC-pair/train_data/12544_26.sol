contract c12544{
    /**
     * Allows the owner to shorten the deadline of the current ICO phase.
     * 
     * @param _daysToShortenBy The number of days to shorten the deadline by.
     * */
    function shortenDeadline(uint256 _daysToShortenBy) public onlyOwner {
        if(now.sub(_daysToShortenBy.mul(1 days)) < endTime) {
            endTime = now;
        }
        endTime = endTime.sub(_daysToShortenBy.mul(1 days));
        DeadlineShortened(_daysToShortenBy);
    }
}