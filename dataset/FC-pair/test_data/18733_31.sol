contract c18733{
    /**
     * These helper functions are exposed for changing the start and end time dynamically   
     */
    function changeStartTime(uint256 _startTime) external onlyOwner {startTime = _startTime;}
}