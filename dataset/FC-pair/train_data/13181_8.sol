contract c13181{
    /**
     * Number of participants who are still owed.
     */
    function backlogLength() public view returns (uint256){
        return participants.length - payoutOrder;
    }
}