contract c9379{
    /**
     * @dev Implements the ICOEngineInterface.
     * @return Timestamp of the ico end time.
     */
    function endTime() public view returns(uint) {
        return end;
    }
}