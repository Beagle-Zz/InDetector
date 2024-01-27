contract c2429{
    /**
    *@dev Counts number of start dates in this factory
    *@return the number of active start dates
    */
    function getDateCount() public constant returns(uint) {
        return startDates.length;
    }
}