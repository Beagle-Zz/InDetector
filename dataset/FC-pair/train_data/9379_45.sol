contract c9379{
    /**
     * @dev Implements the ICOEngineInterface.
     * @return False if the ico is not started, false if the ico is started and running, true if the ico is completed.
     */
    function ended() public view returns(bool) {
        if (block.timestamp >= end) {
            return true;
        } else {
            return false;
        }
    }
}