contract c18688{
    /**
     * @dev  To pause the contract's functions should the need arise. Internal.
     *       Logs an event of the pausing.
     *
     * @param _id    A uint to identify the caller of this function.
     */
    function pauseContract(uint _id) internal {
      paused = true;
      emit LogFunctionsPaused(_id, now);
    }
}